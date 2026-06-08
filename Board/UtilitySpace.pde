class UtilitySpace extends Property {
  
  UtilitySpace(int c, String n) {
    super(n, c);
  }
  
   void draw(int x, int y, int z) {
      textSize(10);
     int h = 0; 
     int w = 0;
    if (z == 1 || z ==3) {
      w = 50;
      h = 100;
    }
    if (z == 2 || z == 4) {
      w = 100;
      h = 50;
    }
     fill(210, 229, 210);
     rect(x, y, w, h);
     if (z == 1) {
     fill(0, 0, 0);
     text(getName(), x + 2, y + 10);
     text( "$" + getCost(), x + 2, y + 30);
     }
     else if (z == 2) {
     fill(0, 0, 0);
     text(getName(), x + 15, y + 20);
     text( "$" + getCost(), x + 72, y + 30);
     }
     else if (z == 3) {
     fill(0, 0, 0);
     text(getName(), x + 12, y + 25);
     text( "$" + getCost(), x + 15, y + 85);
     }
     else {
     fill(0, 0, 0);
     text(getName(), x + 2, y + 20);
     text( "$" + getCost(), x + 30, y + 25);
     }
     
    }
  
}
