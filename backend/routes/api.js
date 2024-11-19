import { Hono } from "hono";
import { getAdmitCards } from "../controllers/admitCardController.js";
import { getJobs } from "../controllers/jobController.js";
import { getResults } from "../controllers/resultController.js";

const api = new Hono();

api.get("/admit-cards", getAdmitCards);
api.get("/jobs", getJobs);
api.get("/results", getResults);

export default api;
