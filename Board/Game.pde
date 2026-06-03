BoardObj board;

void setup() {
  size(650, 850);
  board = new BoardObj();
}


void draw() {
  board.draw();
}

void keyPressed() {
  if (key == 'r') {
    board.playerTurn();
  }
}
