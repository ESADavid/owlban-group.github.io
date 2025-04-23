/**
 * Script to fetch stock ticker data and update SharePoint dashboard JSON data file.
 * This script uses the Alpha Vantage API and updates a local JSON file that can be consumed by the dashboard.
 * 
 * Usage: node stock-ticker-integration.js [API_KEY] [TICKER_SYMBOL] [OUTPUT_JSON_PATH]
 */

const https = require('https');
const fs = require('fs');

const apiKey = process.argv[2];
const ticker = process.argv[3];
const outputPath = process.argv[4];

if (!apiKey || !ticker || !outputPath) {
  console.error('Usage: node stock-ticker-integration.js [API_KEY] [TICKER_SYMBOL] [OUTPUT_JSON_PATH]');
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
        const stockData = json['Global Quote'];
        // Write stock data to JSON file
        fs.writeFileSync(outputPath, JSON.stringify(stockData, null, 2));
        console.log(`Stock data for ${ticker} saved to ${outputPath}`);
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
