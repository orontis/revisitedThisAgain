class Player {
  
  private int money;   
  private ArrayList<Property> ownedProperties;
  private int spaceIndex;
  private int playerID;
  private int jailCards;
  private int jailTime;
  
  
  Player(int m, int ID) {
    money = m;
    playerID = ID;
    ownedProperties = new ArrayList<Property>();
    spaceIndex = 0;
    jailCards = 0;
    jailTime = 0;   
  }
  
  void buyProperty(Property p) {
    if (p == null) {
      return;
    }
    if (money >= p.getCost()) {
      money -= p.getCost();
      ownedProperties.add(p);
      p.setOwner(this);
      println("Player " + playerID + " bought " + p.getName());
    }
    else {
      println("Not enough money");
    }
  }
  
  void earnMoney(int amount) {
    money += amount;
  }
  
  void rollMove(Space[] board) { // UNFINISHED
    if (jailTime > 0) {
      jailTime--;
      println("Still in jail; " + jailTime + " rounds till freedom");
      return;
    }
    int die1 = int(random(1,7));
    int die2 = int(random(1,7));
    int move = die1 + die2;
    int oldpos = spaceIndex;
    spaceIndex = (spaceIndex + move) % 40;
    if (spaceIndex < oldpos) {
      money += 200;
      println("Passed GO (+$200)");
    }
    println("Rolled " + die1 + " and " + die2);
    println("Moved to space " + spaceIndex);
    Space landed = board[spaceIndex];
    println("Landed on " + landed.getName());
  }
  
  void goToJail() {
    spaceIndex = 10; // jailspace
    jailTime = 3;
  }
  
  int getMoney() {
    return money;
  }
  int getSpaceIndex() {
    return spaceIndex;
  }
  int getPlayerID() {
    return playerID;
  }
  
  
  
  }
