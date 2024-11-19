import { Hono } from "hono";
import api from "./routes/api.js";

const app = new Hono();

app.route("/api", api);

app.notFound((req, res) => {
  res.status(404).send({ message: "Not Found" });
});

app.listen(3000, () => {
  console.log("Server running on http://localhost:3000");
});
