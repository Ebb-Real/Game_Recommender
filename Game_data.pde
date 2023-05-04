/*Vores data er sorteret i Arrays. Det betyder at hvert eneste spil har sit
 eget array hver deres vr en plads. Følgende
 pladser i array viser følgende ting:
 [0]=story/roleplay
 [1]=combat
 [2]=multiplayer
 [3]=management
 
 alternativt
 
 {4(story), 2(combat), 3(multiplayer), 2(management)};
 */

HashMap<String, ArrayList<Integer>> formatData(String[] lines) {
  HashMap<String, ArrayList<Integer>> gameData = new HashMap<String, ArrayList<Integer>>();

  for (int i=0; i < lines.length; i++) {
    String[] split = lines[i].split(":");
    String noegle = split[0];
    String values = split[1];

    ArrayList<Integer> parametre = new ArrayList<Integer>();
    
    String[] splitValues = values.split(", ");
    
    for(int j=0; j < splitValues.length; j++){
       parametre.add(2, int(splitValues[j]));
    }
    
    gameData.put(noegle, parametre);
  }

  return gameData;
}
