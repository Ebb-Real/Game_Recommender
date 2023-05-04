/*Dette stykke koder finder forskellen mellem slider (det som bruger har valgt) og
 værdien på et spil og bruger dermed den mindste forskel på de forskellige paramtre
 til at sammenligne det bedste match. Hvis du er i tvivl om noget så spørg Lucas */


//KNAP AKTIVERING MANGLER
/* if (KNAP KLIKKET PÅ) {
 
 spirit_of_the_island[0] - StoryRoleplaySlider.currentPriority = int siStoryValue;
 spirit_of_the_island[1] - CombatSlider.currentPriority = int siCombatValue;
 spirit_of_the_island[2] - MultiplayerSlider.currentPriority = int siMultiplayerValue:
 spirit_of_the_island[3] - ManagementSlider.currenctPriority = int siManagementValue;
 int spirit_of_the_island_value = siStoryValue + siCombatValue + siMultiplayerValue + siManagementValue
 }
 */

if(evaluate = true){
String hentBedsteMatch(HashMap<String, ArrayList<Integer>> gameData, ArrayList<Integer> selections) {
  HashMap<String, Integer> scores = new HashMap<String, Integer>();
  
  for (Map.Entry<String, ArrayList<Integer>> entry : gameData.entrySet()) {
    int score = 0;
    for (int i=0; i < entry.getValue().size(); i++) {
      score += entry.getValue().get(i) - selections.get(i);
    }
    scores.put(entry.getKey(), score);
  } //for loop find lav score
  
  Integer lowestScore = null;
  String lowestGame = "";
  
  for (Map.Entry<String, Integer> entry : scores.entrySet()) {
    if(lowestScore == null){
       lowestGame = entry.getKey();
       lowestScore = entry.getValue();
       continue;
    } else if(entry.getValue() < lowestScore){
       lowestGame = entry.getKey();
       lowestScore = entry.getValue();
    }
  }//for map.entry find lavest score
  return lowestGame;
}//hent bedste match hashmap
}//if
