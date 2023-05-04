String hentBedsteMatch(ArrayList<Integer> selections) {
  HashMap<String, Integer> scores = new HashMap<String, Integer>();

  for (Map.Entry<String, ArrayList<Integer>> entry : this.gameData.entrySet()) {
    int score = 0;
    for (int i=0; i < entry.getValue().size(); i++) {
      int vaerdi = Math.abs(entry.getValue().get(i) - selections.get(i));
      score += vaerdi ; // entry.getValue().get(i) - selections.get(i);
    }
    scores.put(entry.getKey(), score);
  } //for loop find lav score

  Integer lowestScore = null;
  String lowestGame = "";

  for (Map.Entry<String, Integer> entry : scores.entrySet()) {
    if (lowestScore == null) {
      lowestGame = entry.getKey();
      lowestScore = entry.getValue();
      continue;
    } else if (entry.getValue() < lowestScore) {
      lowestGame = entry.getKey();
      lowestScore = entry.getValue();
    }
  }//for map.entry find lavest score
  return lowestGame;
}//hent bedste match hashmap
