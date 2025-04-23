/**
 * Script to fetch real-time stock ticker data from Alpha Vantage API
 * and output JSON data for integration into dashboard or data system.
 * 
 * Usage: node stock-ticker-fetcher.js [API_KEY] [TICKER_SYMBOL]
 */

const https = require('https');

const apiKey = process.argv[2];
const ticker = process.argv[3];

if (!apiKey || !ticker) {
  console.error('Usage: node stock-ticker-fetcher.js [API_KEY] [TICKER_SYMBOL]');
  process.exit(1);
}

const url = `https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=${ticker}&apikey=${apiKey}`;

https.get(url, (res) => {
  let data = '';

  res.on('data', (chunk) => {
    data += chunk;
  });

  res.on('end', () => {
    try {
      const json = JSON.parse(data);
      if (json['Global Quote']) {
        console.log(JSON.stringify(json['Global Quote'], null, 2));
      } else {
        console.error('No data found for ticker:', ticker);
      }
    } catch (err) {
      console.error('Error parsing response:', err.message);
    }
  });
}).on('error', (err) => {
  console.error('Error fetching data:', err.message);
});
