import express from 'express';
import bodyParser from 'body-parser';
import fetch from 'node-fetch';

const app = express();
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

const backendUrl = 'http://localhost:5002/submit';



app.get('/', (req, res) => {
  res.send(`
    <h1>Submit Form</h1>
    <form method="POST" action="/submit">
      <label>Name:</label><br/>
      <input name="name" type="text" required/><br/>
      <label>Email:</label><br/>
      <input name="email" type="email" required/><br/><br/>
      <button type="submit">Submit</button>
    </form>
  `);
});

app.post('/submit', async (req, res) => {
  const { name, email } = req.body;

  try {
    const response = await fetch(backendUrl, {
      method: 'POST',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({ name, email })
    });
    const data = await response.json();
    res.send(`<h2>${data.message}</h2><a href="/">Go back</a>`);
  } catch (err) {
    res.status(500).send('Error connecting to backend');
  }
});

app.listen(3001, '0.0.0.0', () => console.log('Frontend running on http://0.0.0.0:3001'));
