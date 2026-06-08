BoardObj board;
int turnIndex = 0;
Player[] players;
Deck chance;
Deck communityChest;
PlayerState playerState;
String textToDisplay = "";
boolean test = true;




void setup() {
  playerState = PlayerState.BEGINNING_OF_TURN;
  size(650, 850); 
  turnIndex = 0;
  chance = new Deck(16);
  communityChest = new Deck(16);
  board = new BoardObj(chance, communityChest);
  players = new Player[2];
  players[0] = new Player(1500, 0);
  players[1] = new Player(1500, 1);
  if (test) {
  players[0].buyProperty((Property)board.gameBoard[1]);
  players[0].buyProperty((Property)board.gameBoard[3]);
  ((ColorGroupProperty)board.gameBoard[3]).addHouses();
  }
}


void draw() {
  //CHECK FOR END
  if (players[0].getMoney() < 0) {
    fill(0, 0, 0);
    textSize(40);
    text("Player2 wins!", 5, 300);
    return;
  }
  if (players[1].getMoney() < 0) {
    fill(255, 255, 255);
    textSize(40);
    text("Player1 wins!", 5, 300);
    return;
  }
  
  board.draw();
  fill(255, 255, 255);
  rect(375, 300, 150, 150);
  fill(0, 0, 0);
  textSize(40);
  text("Roll", 375, 290);
  
  fill(255, 255, 255);
  rect(100, 100, 450, 150);
  textSize(30);
  fill(0, 0, 0);
  text(textToDisplay, 120, 140);
  
  
  
 
//PLAYER STATS  
  
  displayInfo();
  
//Whose turn is it

if (playerState == PlayerState.END_OF_TURN) {
   endTurn();
}
  
// SET UP THE BUTTONS
  textSize(20);
  fill(0, 0, 0);
  text("Buy houses", 110, 298);
  text("In jail:", 110, 328);
  text("Buy property", 110, 358);
  text("Don't buy property", 110, 388);
  text("End turn", 110, 418);
  
   if(playerState == PlayerState.BEGINNING_OF_TURN) {
      rollOn();
    } else {
      rollOff();
    }
    
     if(playerState == PlayerState.BEGINNING_OF_TURN && players[turnIndex].getMoney() >= 100 && players[turnIndex].getMon()) {
      buyHousesOn();
    } else {
      buyHousesOff();
    }
    
     if(playerState == PlayerState.BEGINNING_OF_TURN) {
      rollOn();
    } else {
      rollOff();
    }
    
   if(players[turnIndex].jailTime > 0) {
     jailCardOn();
    } else {
     jailCardOff();
   }
    
     if(playerState == PlayerState.BUYING) {
      buyPropOn();
      dontBuyPropOn();
    } else {
      buyPropOff();
      dontBuyPropOff();
    }
    
     if(playerState == PlayerState.BEGINNING_OF_TURN) {
      rollOn();
    } else {
      rollOff();
    }
    
    if(playerState == PlayerState.END_OF_TURN) {
      endTurnOn();
    } else {
      endTurnOff();
    }
  
// SET PLAYER LOCATIONS  
  fill(255, 0, 0);
  circle(board.X[players[0].getSpace()] + 20, board.Y[players[0].getSpace()] + 10, 10);
  fill(0, 255, 0);
  circle(board.X[players[1].getSpace()] + 10, board.Y[players[1].getSpace()]+ 10, 10 );
  
// RUN THE NEXT TURN

}



void displayInfo() {
  fill(0, 0, 0);
  rect(0, 650, 650, 200);
  fill(255, 255, 255);
  textSize(30);
  text("Player1", 3, 680);
  text("Player2", 328, 680);
  String p1 = "";
  String p2 = "";
  char letter = 'a';
  for(Property x: players[0].ownedProperties ) {
    
    if (playerState == PlayerState.SELECTING_PROPERTY && turnIndex == 0) {
      p1 += letter + ") ";
      letter++;
    }  
    p1 += x.getName() + "\n";
  }
  for(Property x: players[1].ownedProperties ) {
    
    if (playerState == PlayerState.SELECTING_PROPERTY && turnIndex == 1) {
      p2 += letter + ") ";
      letter++;
    }
    p2 += x.getName() + "\n";
  }
  textSize(8);
  text(p1, 170, 655);
  text(p2, 475, 655);
  
  textSize(20);
  text("$" + players[0].getMoney(), 3, 710);
  text("$" + players[1].getMoney(), 328, 710);
}

void endTurn() { 
  playerState = PlayerState.BEGINNING_OF_TURN;
  turnIndex = abs(turnIndex - 1);
}

void keyPressed() {
  if (playerState == PlayerState.SELECTING_PROPERTY) {   
    int index = key - 'a';
    if (index < 0 || index >= players[turnIndex].ownedProperties.size()) {
      return;
    }
    Space space = players[turnIndex].ownedProperties.get(index);
    if(space instanceof ColorGroupProperty) {
    ((ColorGroupProperty)space).addHouses();
    players[turnIndex].loseMoney(100);
    textToDisplay = "House bought.";
    playerState = PlayerState.BEGINNING_OF_TURN;
    }
  }
  
}





void mousePressed() {
  if (mouseX >= 330 && mouseX <= 355 && mouseY >= 280 && mouseY <= 305 && players[turnIndex].getMon()) {
    textToDisplay = ("Buying house. Please\nselect a property.");
    playerState = PlayerState.SELECTING_PROPERTY;
  }
  
  
  
 
  
  
  if (mouseX >= 470 && mouseX <= 495 && mouseY >= 265 && mouseY <= 290 && playerState == PlayerState.BEGINNING_OF_TURN) {
    textToDisplay = players[turnIndex].rollMove(board);
    Space landedOn = board.gameBoard[players[turnIndex].getSpace()];
    playerState = PlayerState.MOVED;
    
//IF CARD SPACE
    if (landedOn instanceof CardSpace) {
      textToDisplay += "\nyou drew a card!";
      int i = (int)(random(0, 100));
      textToDisplay += "\nYou won $" + i;
      players[turnIndex].earnMoney(i);
      playerState = PlayerState.END_OF_TURN;
    }
//IF OWNED PROPERTY
    if (landedOn instanceof Property) {
      Property prop = (Property)landedOn;
      if (prop.isOwned()) {    
        if (prop.getOwner() == players[turnIndex])  {
          textToDisplay += "\nThis is your property"; 
          playerState = PlayerState.END_OF_TURN;
        } 
        else {
          textToDisplay += "\nYou pay $" + prop.getRent();
          players[turnIndex].loseMoney(prop.getRent());
          players[abs(turnIndex - 1)].earnMoney(prop.getRent());
          playerState = PlayerState.END_OF_TURN;
        }
      } else {
        textToDisplay += "\nWould you like to buy it?";
        playerState = PlayerState.BUYING;
      }
    }
    
//IF TAX SPACE
  if (landedOn instanceof TaxSpace) {
    TaxSpace tax = (TaxSpace)landedOn;
    textToDisplay += "\nPaying " + tax.getTax();
    players[turnIndex].loseMoney(tax.getTax());
    displayInfo();
    playerState = PlayerState.END_OF_TURN;
  } 
 
//IF BLANK SPACE
  if(landedOn instanceof BlankSpace) {
    if (landedOn.getName().equals("Go to \njail")) {
      players[turnIndex].jailTime = 3;
      players[turnIndex].spaceIndex = 10;
    }
    playerState = PlayerState.END_OF_TURN;
  }


    
    
    }
 
 if (mouseX >= 330 && mouseX <= 355 && mouseY >= 340 && mouseY <= 365 && playerState == PlayerState.BUYING) {
   if(players[turnIndex].buyProperty((Property)board.gameBoard[players[turnIndex].getSpace()])) {  
   }
   playerState = PlayerState.END_OF_TURN;
   //end turn
 }
 if (mouseX >= 330 && mouseX <= 355 && mouseY >= 370 && mouseY <= 395 && playerState == PlayerState.BUYING) {
     playerState = PlayerState.END_OF_TURN;
   }
 }
 
 
 


void rollOn() {
  fill(20, 200, 20);
  rect(470, 265, 25, 25);  
}

void rollOff() {
  fill(200, 20, 20);
  rect(470, 265, 25, 25); 
}



void buyHousesOn() {
  fill(20, 200, 20);
  rect(330, 280, 25, 25);  
}

void buyHousesOff() {
  fill(200, 20, 20);
  rect(330, 280, 25, 25); 
}

void jailCardOn() {
  fill(20, 200, 20);
  rect(330, 310, 25, 25);  
}

void jailCardOff() {
  fill(200, 20, 20);
  rect(330, 310, 25, 25);
}

void buyPropOn() {
  fill(20, 200, 20);
  rect(330, 340, 25, 25);   
}

void buyPropOff() {
  fill(200, 20, 20);
  rect(330, 340, 25, 25); 
}

void dontBuyPropOn() {
  fill(20, 200, 20);
  rect(330, 370, 25, 25);  
}

void dontBuyPropOff() {
  fill(200, 20, 20);
  rect(330, 370, 25, 25);
}
 
void endTurnOn() {
  fill(20, 200, 20);
  rect(330, 400, 25, 25);  
}

void endTurnOff() {
  fill(200, 20, 20);
  rect(330, 400, 25, 25);
}
