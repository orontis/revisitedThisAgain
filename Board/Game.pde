BoardObj board;
int turnIndex = 0;
Player[] players;
public Deck chance;
public Deck communityChest;
PlayerState playerState;
String textToDisplay = "";




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
}


void draw() {
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
  fill(255, 255, 255);
  textSize(30);
  text("Player1", 3, 680);
  text("Player2", 328, 680);
  
// SET UP THE BUTTONS
  textSize(20);
  fill(0, 0, 0);
  text("Buy houses", 110, 300);
  text("Spend Jail Card", 110, 375);
  text("Buy property", 110, 450);
  text("Don't buy property", 110, 525);
  
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
  
// SET PLAYER LOCATIONS  
  fill(255, 0, 0);
  circle(board.X[players[0].getSpace()], board.Y[players[0].getSpace()], 10);
  fill(0, 255, 0);
  circle(board.X[players[1].getSpace()] + 10, board.Y[players[1].getSpace()]+ 10, 10 );

// RUN THE NEXT TURN
  playerTurn(); 
}

void playerTurn() {
  Player current = players[turnIndex];
  
  turnIndex++;
  turnIndex %= players.length; // wraps turn around (prevents it from going over 1)
}




void mousePressed() {
  if (mouseX >= 470 && mouseX <= 495 && mouseY >= 265 && mouseY <= 290 && playerState == PlayerState.BEGINNING_OF_TURN) {
    textToDisplay = players[turnIndex].rollMove(board);
    Space landedOn = board.gameBoard[players[turnIndex].getSpace()];
    playerState = PlayerState.MOVED;
    
//IF CARD SPACE
    if (landedOn instanceof CardSpace) {
      CardSpace cardSpace = (CardSpace)landedOn;
      Card card = cardSpace.getDeck().drawCard();
      textToDisplay += "\nyou drew a card!";
      card.doThing();
    }
//IF OWNED PROPERTY
    if (landedOn instanceof Property) {
      Property prop = (Property)landedOn;
      if (prop.isOwned()) {    
        if (prop.getOwner() == players[turnIndex])  {
          textToDisplay += "this is your property"; 
        } else {
          textToDisplay += "you pay" + prop.getRent();
          players[turnIndex].loseMoney(prop.getRent());
          players[abs(turnIndex - 1)].earnMoney(prop.getRent());
        }
      } else {
        textToDisplay += "\nWould you like to buy it?";
        playerState = PlayerState.BUYING;
      }
    }
    
//IF TAX SPACE
  if (landedOn instanceof TaxSpace) {
    TaxSpace tax = (TaxSpace)landedOn;
    textToDisplay += "Paying " + tax.getTax();
    players[turnIndex].loseMoney(tax.getTax());
  } 
 
//IF BLANK SPACE


    
    
    }
 
 if (mouseX >= 330 && mouseX <= 355 && mouseY >= 435 && mouseY <= 460 && playerState == PlayerState.BUYING) {
   if(players[turnIndex].buyProperty((Property)board.gameBoard[players[turnIndex].getSpace()])) {
     println("bought");
   }
   //end turn
 }
 if (mouseX >= 330 && mouseX <= 355 && mouseY >= 505 && mouseY <= 530 && playerState == PlayerState.BUYING) {
   //end turn
   }
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
  rect(330, 355, 25, 25);  
}

void jailCardOff() {
  fill(200, 20, 20);
  rect(330, 355, 25, 25);
}

void buyPropOn() {
  fill(20, 200, 20);
  rect(330, 435, 25, 25);   
}

void buyPropOff() {
  fill(200, 20, 20);
  rect(330, 435, 25, 25); 
}

void dontBuyPropOn() {
  fill(20, 200, 20);
  rect(330, 505, 25, 25);  
}

void dontBuyPropOff() {
  fill(200, 20, 20);
  rect(330, 505, 25, 25);
}
 
