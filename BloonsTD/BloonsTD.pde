import java.util.LinkedList;
  Map x;
  Bloons balloon;
void setup(){
  size(823, 530);
  x = new Map("Map.png");
  image(x.getMap(),0,0);
  balloon = new Bloons(1,2, 4, 227,false, false, x);
}
void draw(){
  //setup();
  //text("" + mouseX + ", " + mouseY, 10, 10);
  clear();
  image(x.getMap(),0,0);
  if(balloon.getDraw()){
  balloon.drawBloon();
  }
  balloon.changeCoord();
  
}
