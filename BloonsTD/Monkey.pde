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
  private boolean lead;
  private boolean magic;
  private Dart darts;
  private Bloons bloon;
  private boolean isdart = false;
  private PImage sprite;
  private String link;
  private int reloadTimer = millis();
  
  private boolean upgrade1a = false;
  private boolean upgrade1b = false;
  private boolean upgrade2a = false;
  private boolean upgrade2b = false;
  private boolean wasPlaced = false;
  private boolean UpgradeMode = false;
  

  // Constructor
  public Monkey(String image, float placeX, float placeY) {
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
      placementRadius = 40;
      cost = 2750;
      damage = 1;
      lead = false;
      magic = false;
    } else if (link.equals("Monkeys/DartMonkey.png")) {
      reload = 400;
      range = 100;
      seeCamo = false;
      land = true;
      water = false;
      placementRadius = 30;
      cost = 170;
      damage = 1;
      lead = false;
      magic = false;
    } else if (link.equals("Monkeys/SniperMonkey.png")) {
      reload = 800;
      range = 750;
      seeCamo = false;
      land = true;
      water = false;
      placementRadius = 50;
      cost = 300;
      damage = 2;
      lead = false;
      magic = false;
    } else if (link.equals("Monkeys/NinjaMonkey.png")) {
      reload = 400;
      range = 150;
      seeCamo = true;
      land = true;
      water = false;
      placementRadius = 40;
      cost = 500;
      damage = 1;
      lead = false;
      magic = false;
    }
  }


  // Accessors
  public String getLink() {
    return link; 
  }
  public Dart getDart() {
    return darts;
  }
  public int getCost() {
    return cost;
  }
  public int getReload() {
    return reload;
  } 
  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
  public int getReloadTimer() {
    return reloadTimer;
  }
  public PImage getSprite() {
    return sprite;
  }
  public boolean getCamo() {
    return seeCamo;
  }
  public boolean getUpgrade2b() {
    return upgrade2b;
  }
  public boolean getUpgrade2a() {
    return upgrade2a;
  }
  public boolean getUpgrade1b() {
    return upgrade1b;
  }
  public boolean getUpgrade1a() {
    return upgrade1a;
  }
  public boolean getWasPlaced() {
    return wasPlaced; 
  }
  public boolean getUpgradeMode() {
    return UpgradeMode; 
  }

  public void setPlaced() {
    wasPlaced = true; 
  }
  public void resetTimer(int a) {
    reloadTimer = a;
  }
  public void setReload(int a) {
    reload = a; 
  }
  public void setRange(int a){
    range = a;
  } 
  
  public void setUpgrade2b() {
    upgrade2b = true; 
  }
  public void setUpgrade2a() {
    upgrade2a = true;
  }
  public void setUpgrade1b() {
    upgrade1b = true;
  }
  public void setUpgrade1a() {
    upgrade1a = true;
  }
  public void setUpgradeMode() {
    UpgradeMode = !UpgradeMode; 
  }
  
  public boolean activateUpgrade2b() {
    return upgrade2b;
  }
  public boolean activateUpgrade2a() {
    return upgrade2a;
  }
  public boolean activateUpgrade1b() {
    return upgrade1b;
  }
  public void activateUpgrade1a() {
    if (link.equals("Monkeys/NinjaMonkey.png")) {
      reload = 200;
      range = 175;
      upgrade1a = true;
      fill(#964B00);
      rect(0, 530, 290, 70); 
      fill(#FFA500);
      textSize(20);
      text("Burning Shurikens: Ninja's \nshurikens can burn through lead", 5, 560);   
    }
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
        PVector direction = bloon.getDirection();
        float[] move = direction.array();
        float x = bloon.getX()+5;
        float y = bloon.getY()+5;
        if (Math.round(move[0]) == 1 && Math.round(move[1]) == 0) {
          x = bloon.getX()-30;
          y = bloon.getY();
        }
        if (Math.round(move[0]) == 0 && Math.round(move[1]) == -1) {
          x = bloon.getX();
          y = bloon.getY()+30;
        }
        if (Math.round(move[0]) == -1 && Math.round(move[1]) == 0) {
          x = bloon.getX()+30;
          y = bloon.getY();
        }
        if (Math.round(move[0]) == 0 && Math.round(move[1]) == 1) {
          x = bloon.getX();
          y = bloon.getY()-30;
        }
        if (!magic && bloon.getMagic()) {
          bloon.popLayers(0);
        } else if (!magic && bloon.getSharp()) {
          bloon.popLayers(0);
        } else {
          bloon.popLayers(damage);

          if (a == 6) {
            addBloons(new Bloons(5, x, y, bloon.getCamo(), bloon.getRegrow(), new Map("Map.png"), getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
          }
          if ((a == 7) && (bloon.getSpeed() == 0.51)) {
            addBloons(new SpecialBloons(6, x, y, bloon.getCamo(), bloon.getRegrow(), new Map("Map.png"), false, true, false, false, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
          }
          if ((a == 7) && (bloon.getSpeed() == 0.9)) {
            addBloons(new SpecialBloons(6, x, y, bloon.getCamo(), bloon.getRegrow(), new Map("Map.png"), false, true, false, false, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
          }
          if (a == 8) {
            addBloons(new SpecialBloons(7, x, y, bloon.getCamo(), bloon.getRegrow(), new Map("Map.png"), true, true, false, false, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
          }
          if (a == 9 && bloon.getHealth() <= 1) {
            addBloons(new SpecialBloons(8, x, y, bloon.getCamo(), bloon.getRegrow(), new Map("Map.png"), true, true, false, false, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
          }
          if (a == 10 && bloon.getHealth() <= 1) {
            if (Math.round(move[0]) == 1 && Math.round(move[1]) == 0) {
              addBloons(new Boss(9, x-30, y, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 10, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(9, x+30, y, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 10, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(9, x+60, y, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 10, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
            }
            if (Math.round(move[0]) == 0 && Math.round(move[1]) == -1) {
              addBloons(new Boss(9, x, y+30, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 10, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(9, x, y-30, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 10, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(9, x, y-60, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 10, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
            }
            if (Math.round(move[0]) == -1 && Math.round(move[1]) == 0) {
              addBloons(new Boss(9, x+30, y, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 10, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(9, x-30, y, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 10, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(9, x-60, y, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 10, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
            }
            if (Math.round(move[0]) == 0 && Math.round(move[1]) == 1) {
              addBloons(new Boss(9, x, y-30, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 10, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(9, x, y+30, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 10, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(9, x, y+60, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 10, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
            }
          }
          if (a == 11 && bloon.getHealth() <= 1) {
            if (Math.round(move[0]) == 1 && Math.round(move[1]) == 0) {
              addBloons(new Boss(10, x-30, y, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 200, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(10, x+30, y, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 200, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(10, x+60, y, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 200, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
            }
            if (Math.round(move[0]) == 0 && Math.round(move[1]) == -1) {
              addBloons(new Boss(10, x, y+30, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 200, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(10, x, y-30, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 200, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(10, x, y-60, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 200, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
            }
            if (Math.round(move[0]) == -1 && Math.round(move[1]) == 0) {
              addBloons(new Boss(10, x+30, y, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 200, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(10, x-30, y, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 200, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(10, x-60, y, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 200, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
            }
            if (Math.round(move[0]) == 0 && Math.round(move[1]) == 1) {
              addBloons(new Boss(10, x, y-30, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 200, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(10, x, y+30, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 200, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(10, x, y+60, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 200, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
            }
          }
          if (a == 12 && bloon.getHealth() <= 1) {
            if (Math.round(move[0]) == 1 && Math.round(move[1]) == 0) {
              addBloons(new Boss(11, x-30, y, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 700, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(11, x+30, y, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 700, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(11, x+60, y, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 700, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
            }
            if (Math.round(move[0]) == 0 && Math.round(move[1]) == -1) {
              addBloons(new Boss(11, x, y+30, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 700, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(11, x, y-30, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 700, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(11, x, y-60, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 700, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
            }
            if (Math.round(move[0]) == -1 && Math.round(move[1]) == 0) {
              addBloons(new Boss(11, x+30, y, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 700, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(11, x-30, y, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 700, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(11, x-60, y, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 700, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
            }
            if (Math.round(move[0]) == 0 && Math.round(move[1]) == 1) {
              addBloons(new Boss(11, x, y-30, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 700, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(11, x, y+30, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 700, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
              addBloons(new Boss(11, x, y+60, bloon.getRegrow(), bloon.getCamo(), new Map("Map.png"), 700, 1, getBloon(), getCamoBloon(), getRegrowBloon(), getCamoRegrowBloon(), bloon.getTileCount()));
            }
          }
        }
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
          darts = new Dart(5, 20, x, y, color(#000000));
        } else if (link.equals("Monkeys/SuperMonkey.png") && magic) {
          darts = new Dart(30, 10, x, y, color(#c321a5));
        } else {
          darts = new Dart(5, 10, x, y, color(#000000));
        }
        isdart = true;
      }
    }
  }
}
