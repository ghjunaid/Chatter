import {Router, Request, Response} from 'express';
import pool from '../models/db';
import { verifyToken } from '../middlewares/authMiddleware';

const router = Router();

router.get('/', verifyToken, async (req: Request, res: Response) => {
    let userId = null;
    if(req.user){
        userId = req.user.id;
    }

    try {
        const result = await pool.query(
            `
            SELECT c.id AS conversation_id, u.username AS participant_name, m.content AS last_message, m.created_at AS last_message_time
            FROM conversations c
            JOIN users u ON u.id = CASE WHEN c.participate_one = $1 THEN c.participate_two ELSE c.participate_one END
            LEFT JOIN LATERAL (
                SELECT content, created_at
                FROM messages
                WHERE conversation_id = c.id
                ORDER BY created_at DESC
                LIMIT 1
            ) m ON true
            WHERE c.participate_one = $1 OR c.participate_two = $1
            ORDER BY COALESCE(m.created_at, c.created_at) DESC
            `,
            [userId]
        );
        res.json(result.rows);
    } catch (error) {
        res.status(500).json({error: 'Failed to fetch conversation'})
    }
});

export default router;