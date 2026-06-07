class ColorGroupProperty extends Property {
  
  private String hue;
  private int numHouses;
  
  ColorGroupProperty(int c, String h, String n) {
    super(n, c);
    hue = h;
    numHouses = 0;
  }
  
  String getColor() {
    return hue;
  }
  
  int getNumHouses() {
    return numHouses;
  }
  
  void addHouses() {
    if (numHouses < 5) numHouses++;
  }
  
  int getRent() {
    return super.getRent() + numHouses * 50;
  }
  
  void colorChange() {
    if (hue.equals("Brown")) {
      fill(148, 72, 26);
    }
    if (hue.equals("Light Blue")) {
      fill(185, 227, 247);
    }
    if (hue.equals("Pink")) {
      fill(214, 47, 140);
    }
    if (hue.equals("Orange")) {
      fill(239, 140, 0);
    }
    if (hue.equals("Red")) {
      fill(228, 12, 3);
    }
    if (hue.equals("Yellow")) {
      fill(255, 235, 0);
    }
    if (hue.equals("Green")) {
      fill(0, 174, 65);
    }
    if (hue.equals("Blue")) {
      fill(0, 104, 179);
    }
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
     colorChange();
     if (z == 1) {
     rect(x, y + 80, 50, 20); 
     fill(0, 0, 0);
     text(getName(), x + 2, y + 60);
     text( "$" + getCost(), x + 15, y + 15);
     }
     else if (z == 2) {
     rect(x, y, 20, 50);
     fill(0, 0, 0);
     text(getName(), x + 25, y + 20);
     text( "$" + getCost(), x + 72, y + 30);
     }
     else if (z == 3) {
     rect(x, y, 50, 20);
     fill(0, 0, 0);
     text(getName(), x + 8, y + 35);
     text( "$" + getCost(), x + 15, y + 85);
     }
     else {
     rect(x + 80, y, 20, 50);
     fill(0, 0, 0);
     text(getName(), x + 30, y + 25);
     text( "$" + getCost(), x + 2, y + 25);
     }
    
    
    
   }
  
}
