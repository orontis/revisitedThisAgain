class Player {
  
  private int money;   
  private ArrayList<Property> ownedProperties;
  private int spaceIndex;
  private int playerID;
  private int jailCards;
  private int jailTime;
  
  
 public int getSpace() {
    return spaceIndex;
  }
  
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
    if (p.getOwner() != null) {
      println("Property already owned");
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
  
  String rollMove(BoardObj board) { // UNFINISHED
   
    println("It's your turn! Rolling the die, to move around the board.");
    int die1 = int(random(1,7));
    int die2 = int(random(1,7));
    int move = die1 + die2;
    String textToDisplay = "you rolled " + die1 + " and " + die2;
    int oldpos = spaceIndex;
    spaceIndex = (spaceIndex + move) % 40;
    textToDisplay += "\nlanded on " + board.gameBoard[spaceIndex].getName();
    if (spaceIndex < oldpos) {
      money += 200;
      textToDisplay += ("\nPassed GO (+$200)");   
    }

      return textToDisplay;
    
  }
    //Space landed = board[spaceIndex];
    //direction("Landed on " + landed.getName());
    //if (landed instanceof Property) {
    //  Property p = (Property) landed;
    //  if (p.getOwner() != null && p.getOwner() != this) {
    //    int rent = p.getRent();
    //    money -= rent;
    //    p.getOwner().earnMoney(rent);
    //   direction("Paid $" + rent + " rent");
    //  }
    
  //  else if (landed instanceof CardSpace) {
  ////    int b = landed.getID();
  ////    drawCard(b);
  //  }
  //  else if (landed instanceof TaxSpace) {
      
  //  }
  //  else if (landed instanceof BlankSpace) {
      
  //  }
  //}
  
  
  
  
  void goToJail() {
    spaceIndex = 10; // jailspace
    jailTime = 3;
    println("Sent to jail");
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
 

  

  
  
  
  
