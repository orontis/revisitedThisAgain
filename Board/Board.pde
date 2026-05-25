class BoardObj {
Deck chance;
Deck communityChest;
Player[] players;
int turnIndex;
Space[] gameBoard;


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
  gameBoard[1] = new ColorGroupProperty(60, "Brown", "Mediterranean Avenue");
  // WILL FINISH THE REST LATER
}

void playerTurn() {
  Player current = players[turnIndex];
  current.rollMove(gameBoard);
  turnIndex++;
  turnIndex %= players.length; // wraps turn around (prevents it from going over 1)
}

}
