import express from 'express';
import mongoose from 'mongoose';
import dotenv from 'dotenv';
import userRoutes from './routes/user.js';
import cors from 'cors';

dotenv.config();

const app = express();
const port = process.env.PORT || 9001;

app.use(express.json());
app.use(cors());
app.use('/api', userRoutes);

mongoose.connect(process.env.MONGODB_URI)
  .then(() => console.log(' Conectado a MongoDB Atlas'))
  .catch((error) => console.error(' Error de conexión:', error));

app.listen(port, () => {
  console.log(` Servidor corriendo en http://localhost:${port}`);
});
