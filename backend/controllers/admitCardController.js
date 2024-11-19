import admitCardData from "../data/admit-card.json";

export const getAdmitCards = (req, res) => {
  res.json(admitCardData);
};
