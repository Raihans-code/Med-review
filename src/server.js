import "dotenv/config";
import express from 'express';
import { connectDB, disconnectDB } from "./database/db.js";

import authRoutes from "./routes/authRoutes.js"

connectDB();



const PORT = process.env.PORT || 5000;
const app = express();

//Body Parsing Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

//API ROUTES
app.get('/', (req, res) => {
  res.send('Hello, World!');
});

app.use("/auth",authRoutes);




const server = app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}...`);
});


// Handle unhandled promise rejections (e.g., database connection errors)
process.on("unhandledRejection", (err) => {
  console.error("Unhandled Rejection:", err);
  server.close(async () => {
    await disconnectDB();
    process.exit(1);
  });
});

// Handle uncaught exceptions
process.on("uncaughtException", async (err) => {
  console.error("Uncaught Exception:", err);
  await disconnectDB();
  process.exit(1);
});

// Graceful shutdown
process.on("SIGTERM", async () => {
  console.log("SIGTERM received, shutting down gracefully");
  server.close(async () => {
    await disconnectDB();
    process.exit(0);
  });
});

