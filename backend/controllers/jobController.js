import latestJobData from "../data/latestjobdata.json";

export const getJobs = (req, res) => {
  res.json(latestJobData);
};
