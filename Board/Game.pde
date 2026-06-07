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
  board = new BoardObj(chance, communityChest);
  turnIndex = 0;
  chance = new Deck(16);
  communityChest = new Deck(16);
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
  textSize(40);
  fill(0, 0, 0);
  text(textToDisplay, 120, 140);
  
  
  if(playerState == PlayerState.BEGINNING_OF_TURN) {
    fill(20, 200, 20);
  } else {
    fill(200, 20, 20);    
  }
  rect(470, 265, 25, 25); 
  
  textSize(30);
  fill(0, 0, 0);
  text("Buy houses", 110, 300);
  text("Spend Jail Card", 110, 400);
  text("Buy houses", 110, 500);
  
  fill(200, 20, 20);
  rect(330, 280, 25, 25);
  rect(330, 380, 25, 25);
  rect(330, 480, 25, 25);
  
  fill(255, 0, 0);
  circle(board.X[players[0].getSpace()], board.Y[players[0].getSpace()], 10);
  
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
    if (landedOn instanceof CardSpace) {
      CardSpace cardSpace = (CardSpace)landedOn;
      cardSpace.getDeck().drawCard();
    }
  }
 
}
