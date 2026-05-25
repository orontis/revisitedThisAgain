BoardObj board;

void setup() {
  size(800, 800);
  board = new BoardObj();
}


void draw() {
  
}

void keyPressed() {
  if (key == 'r') {
    board.playerTurn();
  }
}
