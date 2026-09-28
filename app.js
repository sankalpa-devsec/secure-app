const http = require('http');

// Industry best practice: Passwords/Keys come from environment variables, not hardcoded
const PORT = process.env.PORT || 3000;

const server = http.createServer((req, res) => {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({
        status: 'healthy',
        message: 'DevSecOps Hardened Node.js Service',
        timestamp: new Date().toISOString()
    }));
});

server.listen(PORT, () => {
    console.log(`Application running securely on port ${PORT}`);
});
