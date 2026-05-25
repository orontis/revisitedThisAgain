class Property extends Space {
  
  private Player owner;
  private int cost;
  
  Property(String n, int c) {
    super(n);
    cost = c;
  }
  
  Player getOwner() {
    return owner;
  }
  
  void setOwner(Player p) {
    owner = p; 
  }
  
  boolean isOwned() {
    return (owner != null);
  }
  
  String getName() { // UNFINISHED
    return "fjjfejwfweiowegawhpogpowigpohwgphoawgop PLACEHOLDER";
  }
  
  int getCost() {
    return cost;
  }
  
  int getRent() {
    return (cost / 5);
  }

}
