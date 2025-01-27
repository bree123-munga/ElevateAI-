create URL for the app using this website in java const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 3000;

// Middleware
app.use(bodyParser.json());

// Payment Processing Route
app.post('/pay', async (req, res) => {
  const { phoneNumber, paymentMethod, amount } = req.body;

  if (!phoneNumber || !amount || !paymentMethod) {
    return res.status(400).json({ success: false, error: 'Invalid payment data' });
  }

  const mpesaNumber = '254712345678'; // All payments route to this M-Pesa number

  try {
    // Example logic for payment processing
    if (paymentMethod === 'mpesa') {
      // Simulate processing M-Pesa payment
      console.log(`Processing M-Pesa payment of KES ${amount} to ${mpesaNumber}`);
    } else if (paymentMethod === 'visa') {
      // Simulate processing Visa payment
      console.log(`Processing Visa payment of KES ${amount} to ${mpesaNumber}`);
    } else if (paymentMethod === 'bitcoin') {
      // Simulate processing Bitcoin payment
      console.log(`Processing Bitcoin payment of KES ${amount} to ${mpesaNumber}`);
    } else {
      return res.status(400).json({ success: false, error: 'Unsupported payment method' });
    }

    res.json({ success: true });
  } catch (error) {
    console.error('Payment processing failed:', error);
    res.status(500).json({ success: false, error: 'Payment processing failed' });
  }
});

// Start Server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});