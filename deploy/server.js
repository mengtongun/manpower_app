const express = require("express");
const app = express();
const port = 8001;

app.get("/", (req, res) => {
	res.sendFile("/web/index.html", { root: __dirname });
});

app.use(express.static(__dirname + "/web"));

app.use((req, res) => {
	res.redirect("/");
});

app.listen(port, () => {
	console.log(`app listening at http://localhost:${port}`);
});
