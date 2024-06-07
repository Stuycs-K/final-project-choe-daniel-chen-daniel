public class Monkey {
  // Fields
  private int cost;
  private int range;
  private int damage;
  private int placementRadius;
  private int reload;
  private float direction = 0;
  private float x;
  private float y;
  private boolean land;
  private boolean water;
  private boolean seeCamo;
  private Dart darts;
  private Bloons bloon;
  private boolean isdart = false;
  private PImage sprite;
  private String link;
  private int reloadTimer = millis();

  // Constructor
  public Monkey(String image, int money, float placeX, float placeY) {
    cost = money;
    x = placeX;
    y = placeY;
    link = image;
    sprite = loadImage(image);
    attributeDeclarer();
  }

  public void attributeDeclarer() {
    if (link.equals("Monkeys/SuperMonkey.png")) {
      reload = 0;
      range = 200;
      seeCamo = false;
      land = true;
      water = false;
      placementRadius = 30;
      cost = 2750;
      damage = 1;
    } else if (link.equals("Monkeys/DartMonkey.png")) {
      reload = 400;
      range = 100;
      seeCamo = false;
      land = true;
      water = false;
      placementRadius = 30;
      cost = 170;
      damage = 1;
    } else if (link.equals("Monkeys/SniperMonkey.png")) {
      reload = 800;
      range = 750;
      seeCamo = false;
      land = true;
      water = false;
      placementRadius = 30;
      cost = 300;
      damage = 2;
    }
  }


  // Accessors
  public Dart getDart() {
    return darts;
  }
  public int getCost() {
    return cost;
  }
  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
  public int getRange() {
    return range;
  }
  public int getReload() {
    return reload;
  }
  public int getReloadTimer() {
    return reloadTimer;
  }
  public PImage getSprite() {
    return sprite;
  }
  public boolean getCamo(){
    return seeCamo; 
  }

  public void resetTimer(int a) {
    reloadTimer = a;
  }

  // Methods
  public void drawMonkey() {
    pushMatrix();
    imageMode(CENTER);
    translate(x+22, y-5);
    rotate(radians(90+degrees(direction)));
    image(sprite, 0, 0);
    imageMode(CORNERS);
    popMatrix();
    if (darts != null) {
      darts.changeCoord(bloon);
      darts.drawDart();
      direction = darts.getAngle();
      if (darts.nearBloon(bloon)) {
        int a = bloon.getLayers();
        if (a == 6) {
          addBloons(new Bloons(5, bloon.getX()-5, bloon.getY()-5, false, false, new Map("Map.png"), getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon()));
        }
        bloon.popLayers(damage);
        int b = bloon.getLayers();
        modifyCash(Math.abs(a-b));
        darts = null;
        isdart = false;
      }
    }
  }

  public boolean inRange(float xc, float yc) {
    return (dist(xc, yc, x, y) < placementRadius);
  }

  public void throwDart(ArrayList<Bloons> balloon) {
    int index = 0;
    while (true) {
      if (index >= balloon.size()) {
        break;
      }
      if (balloon.get(index).inRange(x, y, range)) {
        if ((this.getCamo() && balloon.get(index).getCamo()) || !balloon.get(index).getCamo()) {
          bloon = balloon.get(index);
          //text("a", 50, 100);
          break;
        }
      }
      index++;
    }
    if (index < balloon.size()) {
      if (!isdart) {
        if (link.equals("Monkeys/SniperMonkey.png")) {
          darts = new Dart(1, 20, x, y);
        } else {
          darts = new Dart(1, 10, x, y);
        }
        isdart = true;
      }
    }
  }
}
