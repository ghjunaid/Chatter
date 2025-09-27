import { Router } from "express";
import { verifyToken } from "../middlewares/authMiddleware";
import { fetchAllMessageByConversationId } from "../controllers/messageController";

const router = Router();

router.get('/:conversationId', verifyToken, fetchAllMessageByConversationId);

export default router;