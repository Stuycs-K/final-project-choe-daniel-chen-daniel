public class Round {
  int round;
  int balloon = -1;
  
  private PImage[] bloonDisplay;
  private PImage[] bloonCamoDisplay;
  private PImage[] bloonRegrowDisplay;
  private PImage[] bloonCamoRegrowDisplay;
  
  Map x = new Map("Map.png");
  Bloons[][] rounds;

  public Round(PImage[] bloondisplay, PImage[] blooncamo, PImage[] bloonregrow, PImage[] blooncamoregrow) {
    round = 0;
     bloonDisplay = bloondisplay;
      bloonCamoDisplay = blooncamo;
      bloonRegrowDisplay = bloonregrow;
      bloonCamoRegrowDisplay = blooncamoregrow;
      
      rounds = new Bloons[][]{{
      new Bloons(1, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(1, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(1, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(1, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(1, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay)},
    {    new Bloons(1, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(1, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(2, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(1, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(1, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(2, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(1, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(1, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(2, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(2, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay)}, {
      new Bloons(3, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(3, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(3, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(3, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(3, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay)},
    {
      new Bloons(4, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(4, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(4, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(4, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(4, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay)},
    {
      //new SpecialBloons(7, 4.6, 227.0, false, false, new Map("Map.png"), true, true, false, false, bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay), 
      new Bloons(5, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(5, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(5, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(4, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(4, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(4, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(4, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(5, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(5, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay),
      new Bloons(5, 4.6, 227.0, false, false, new Map("Map.png"), bloonDisplay, bloonCamoDisplay,bloonRegrowDisplay, bloonCamoRegrowDisplay)}};
  }
  public void increaseRound() {
    round++;
  }
  public void restartBalloon() {
    balloon = -1; 
  }
  public Bloons getBloon(int round) {
    balloon++;
    if (round >= rounds.length) {
      return null;
    } else {
      if ((balloon < rounds[round].length)) {
        return rounds[round][balloon];
      }
      return null;
    }
  }
}
