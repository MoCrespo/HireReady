import express from "express";
import { config } from "dotenv";
import helmet from "helmet";

config();
const app = express();
const port = process.env.PORT || 3001;

// Middleware
app.use(helmet());
app.use(express.json({ type: "application/json" }));

// Basic Route
app.get("/api/health", (req, res) => {
  res.json({ status: "OK", message: "HireReady Backend is Running!" });
});

// Start Server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
