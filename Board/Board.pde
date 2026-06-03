class BoardObj {
Deck chance;
Deck communityChest;
Player[] players;
int turnIndex;
Space[] gameBoard;
final int[] X = {0, 100, 150, 200, 250, 300, 350, 400, 450, 500, 550};
final int[] Y = {0, 0,    0,    0,  0,   0,   0,   0,   0,   0,   0};

BoardObj() {
  turnIndex = 0;
  chance = new Deck(16);
  communityChest = new Deck(16);
  players = new Player[2];
  players[0] = new Player(1500, 0);
  players[1] = new Player(1500, 1);
  gameBoard = new Space[40];
  createBoard();
}

void createBoard() {
  
  gameBoard[0] = new BlankSpace("GO");
  gameBoard[1] = new ColorGroupProperty(60, "Purple", "Mediterranean Avenue");
  //gameBoard[2] = new CardSpace("Community Chest", 1);
  //gameBoard[3] = new ColorGroupProperty(60, "Purple", "Baltic Avenue");
  //gameBoard[4] = new TaxSpace("Income Tax", 200);
  //gameBoard[5] = new Railroad("Reading Railroad", 200);
  // WILL FINISH THE REST LATER
}

void playerTurn() {
  Player current = players[turnIndex];
  current.rollMove(gameBoard);
  turnIndex++;
  turnIndex %= players.length; // wraps turn around (prevents it from going over 1)
}

void draw() {
  fill (255, 255, 255);
  rect(0, 0, 650, 650);
  
  
 
  for (int i = 0; i < gameBoard.length; i++){
    if (gameBoard[i] != null) {
    //top left corner, z is orientation
 
  int z = 1;
    gameBoard[i].draw(X[i], Y[i], z); 
  }
  }
}

}
