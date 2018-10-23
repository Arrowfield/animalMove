const express = require('express');
let app = express();
app.listen(3000);
app.use(express.static('./static'));