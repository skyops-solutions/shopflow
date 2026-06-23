const express = require('express');
const app = express();

app.get('/health', (req, res) => {
  res.json({ status: 'ok', app: 'shopflow-api' });
});

app.get('/products', (req, res) => {
  res.json([
    { id: 1, name: 'T-Shirt', price: 29.99 },
    { id: 2, name: 'Hoodie', price: 59.99 },
  ]);
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`API running on port ${PORT}`));
