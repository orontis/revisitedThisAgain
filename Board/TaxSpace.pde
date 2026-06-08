class TaxSpace extends Space{
  private int taxAmount;
  
  TaxSpace(String n, int t) {
    super(n);
    taxAmount = t;
    }
  
  int getTax() {
    return taxAmount;
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
     text(getName(), x + 2, y + 65);
     text( "Pay $" + getTax(), x + 2, y + 30);
     }
     else if (z == 2) {
     fill(0, 0, 0);
     text(getName(), x + 30, y + 20);
     text( "Pay $" + getTax(), x + 30, y + 30);
     }
     else if (z == 3) {
     fill(0, 0, 0);
     text(getName(), x + 2, y + 35);
     text( "Pay $" + getTax(), x + 2, y + 45);
     }
     else {
     fill(0, 0, 0);
     text(getName(), x + 50, y + 30);
     text( "Pay $" + getTax(), x + 2, y + 30);
     }
     
    }
    
}
