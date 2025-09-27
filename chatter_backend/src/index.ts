import express, { Request, Response} from 'express';
import authRoutes from './routes/authRoutes';
import conversationsRoutes from './routes/conversationsRoutes';
import messagesRoutes from './routes/messagesRoutes';

const app = express();
app.use(express.json());

app.use('/auth', authRoutes);
app.use('/conversations', conversationsRoutes);
app.use('/messages', messagesRoutes)

const PORT = process.env.PORT || 6000;
app.listen(PORT, ()=>{
    console.log(`Server is running on port ${PORT}`);
})