import resultData from "../data/resultdata.json";

export const getResults = (req, res) => {
  res.json(resultData);
};
