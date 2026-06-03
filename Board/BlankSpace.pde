class BlankSpace extends Space {
  
  BlankSpace(String n) {
    super(n);
    }
    
   void draw(int x, int y, int z) {
     fill(255, 255, 255);
     rect(x, y, 100, 100);
     fill(0, 0, 0);
     textSize(20);
     text(getName(), x + 50, y + 50); 
   }
  
}
