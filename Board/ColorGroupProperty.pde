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
  
}
