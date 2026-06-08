class Player {
  
  private int money;   
  public ArrayList<Property> ownedProperties;
  private int spaceIndex;
  private int playerID;
  public int jailTime;
  private boolean monopoly;
  
 
  
  public boolean getMon() {
    return monopoly;
  }
  
  
 public int getSpace() {
    return spaceIndex;
  }
  
  Player(int m, int ID) {
    money = m;
    playerID = ID;
    ownedProperties = new ArrayList<Property>();
    spaceIndex = 0;
  
    jailTime = 0;
    monopoly = false;
  }
  
  
  boolean buyProperty(Property p) {
    if (p == null) {
      return true;
    }
    if (p.getOwner() != null) {
      println("Property already owned");
      return true;
    }
    if (money >= p.getCost()) {
      money -= p.getCost();
      ownedProperties.add(p);
      p.setOwner(this);
      println("Player " + playerID + " bought " + p.getName());
      if (p instanceof ColorGroupProperty) {
       
        String propColor = ((ColorGroupProperty)p).getColor();
        int count = 0;
        for (int i = 0; i < ownedProperties.size(); i++) {
          if (ownedProperties.get(i) instanceof ColorGroupProperty && 
          ((ColorGroupProperty)ownedProperties.get(i)).getColor().equals(propColor)) 
          
          count++;
        }
        if (count == 3) {
          monopoly = true;
        }
        if (count == 2 && (propColor.equals("Blue") || propColor.equals("Brown"))) {
          monopoly = true;
        }
      }
      
    }
    else {
      return false;
    }
    return false;
  }
  
  
  
  void earnMoney(int amount) {
    money += amount;
  }
  
  void loseMoney(int amount) {
    money -= amount;
  }
  
  String rollMove(BoardObj board) { // UNFINISHED
   
    println("It's your turn! Rolling the die.");
    int die1 = int(random(1,7));
    int die2 = int(random(1,7));
    int move = die1 + die2;
    String textToDisplay = "you rolled " + die1 + " and " + die2;
    int oldpos = spaceIndex;
    if (jailTime > 0) { 
      if (die1 == die2) {
        textToDisplay += "Rolled doubles!\nOut of jail.";
        jailTime = 0;
      } else {
      textToDisplay += "\nStaying in jail.";
       jailTime--;
      }
    } else {
    spaceIndex = (spaceIndex + move) % 40;
    textToDisplay += "\nlanded on " + board.gameBoard[spaceIndex].getName();
    if (spaceIndex < oldpos) {
      money += 200;
      textToDisplay += ("\nPassed GO (+$200)");   
      }
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
  
  String drawCard(Deck deck) { // Does the thing on the card
  Card card = deck.drawCard();
  if (card == null) {
    return "No cards left";
  }
  money += card.getMoneyChange();
  if (card.getDestination() != -1) {
    spaceIndex = card.getDestination();
  }
  if (card.goesToJail()) {
    goToJail();
  }
  return card.getDescription();
}
  
  
  
  
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
 

  

  
  
  
  
