import pool from "../models/db";
import { Request, Response } from "express";

export const fetchAllConversationsByUserId = async (req: Request, res: Response) => {
    let userId = null;
    if(req.user){
        userId = req.user.id;
    }

    try {
        const result = await pool.query(
            `
            SELECT 
                c.id AS conversation_id,
                CASE
                    WHEN u1.id = $1 THEN u2.username
                    ELSE u1.username
                END AS participant_name,
                m.content AS last_message,
                m.created_at AS last_message_time
            FROM conversations c
            JOIN users u1 ON u1.id = c.participate_one
            JOIN users u2 ON u2.id = c.participate_two
            LEFT JOIN LATERAL (
                SELECT content, created_at
                FROM messages
                WHERE conversation_id = c.id
                ORDER BY created_at DESC
                LIMIT 1
            ) m ON true
            WHERE c.participate_one = $1 OR c.participate_two = $1
            ORDER BY m.created_at DESC NULLS LAST;
            `,
            [userId]
        );
        res.json(result.rows);
    } catch (error) {
        res.status(500).json({error: 'Failed to fetch conversations'})
    }
}

//('bob', 'bob@example.com', 'hashedpassword2'),