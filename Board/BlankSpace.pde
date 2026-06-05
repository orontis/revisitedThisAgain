class BlankSpace extends Space {
  
  BlankSpace(String n) {
    super(n);
    }
    
   void draw(int x, int y, int z) {  
     fill(255, 255, 255);
     rect(x, y, 100, 100);
     
    if (z == 1) {
     textSize(60);
     fill(0, 0, 0);
     text(getName(), x + 15, y + 70);
     }
     else if (z == 2) {
     textSize(25);
     fill(0, 0, 0);
     text(getName(), x + 2, y + 55);
     fill(100, 100, 100);
     rect(x + 50, y, 50, 50);
     fill(0, 0, 0);
     text("Jail", x + 56, y + 34);
     
     }
     else if (z == 3) {
      textSize(25);
     fill(0, 0, 0);
     text(getName(), x + 10, y + 45);
     }
     else {
     textSize(40);
     fill(0, 0, 0);
     text(getName(), x + 2, y + 30);
     } 
   }
  
}
