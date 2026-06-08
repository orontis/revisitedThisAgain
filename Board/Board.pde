class BoardObj {


public Space[] gameBoard;
public final int[] X = {0,   100, 150, 200, 250, 300, 350, 400, 450, 500, 
                 550, 550, 550, 550, 550, 550, 550, 550, 550, 550, 
                 550, 500, 450, 400, 350, 300, 250, 200, 150, 100, 
                 0,   0,   0,   0,   0,   0,   0,   0,   0,   0};
public  final int[] Y = { 0,  0,   0,    0,  0,   0,   0,   0,   0,   0, 
                  0,  100, 150, 200, 250, 300, 350, 400, 450, 500,
                 550, 550, 550, 550, 550, 550, 550, 550, 550, 550,
                 550, 500, 450, 400, 350, 300, 250, 200, 150, 100,};

BoardObj(Deck chance, Deck communityChest) {
  gameBoard = new Space[40];
  createBoard(chance, communityChest);
  
  
}

int getPropIndex(Property p) {
  for (int i = 0; i < gameBoard.length; i++) {
    if (gameBoard[i] == p) {
      return i;
    }
  }
  return -1;
}

void createBoard(Deck chance, Deck communityChest) {
  
  gameBoard[0] = new BlankSpace("GO");
  gameBoard[1] = new ColorGroupProperty(60, "Brown", "Med.\nAvenue");
  gameBoard[2] = new CardSpace("Community \nChest", communityChest);
  gameBoard[3] = new ColorGroupProperty(60, "Brown", "Baltic Avenue");
  gameBoard[4] = new TaxSpace("Income Tax", 200);
  gameBoard[5] = new Railroad("Reading RR", 200);
  gameBoard[6] = new ColorGroupProperty(100, "Light Blue", "Oriental\nAvenue");
  gameBoard[7] = new CardSpace("Chance", chance);
  gameBoard[8] = new ColorGroupProperty(100, "Light Blue", "Vermont\nAvenue");
  gameBoard[9] = new ColorGroupProperty(120, "Light Blue", "Con.\nAvenue");
  gameBoard[10] = new BlankSpace("Just \nvisiting");
  gameBoard[11] = new ColorGroupProperty(140, "Pink", "St. Charles Place");
  gameBoard[12] = new UtilitySpace(150,  "Electric \nCompany");
  gameBoard[13] = new ColorGroupProperty(140, "Pink", "States Avenue");
  gameBoard[14] = new ColorGroupProperty(160, "Pink", "Virginia Avenue");
  gameBoard[15] = new Railroad("Penn. RR", 200);
  gameBoard[16] = new ColorGroupProperty(180, "Orange", "St.James Place");
  gameBoard[17] = new CardSpace("Community \nChest", communityChest);
  gameBoard[18] = new ColorGroupProperty(180, "Orange", "Tenn. Avenue");
  gameBoard[19] = new ColorGroupProperty(200, "Orange", "New York Avenue");
  gameBoard[20] = new BlankSpace("Free \nParking");
  gameBoard[21] = new ColorGroupProperty(220, "Red", "Kentucky\nAvenue");
  gameBoard[22] = new CardSpace("Chance", chance);
  gameBoard[23] = new ColorGroupProperty(220, "Red", "Indiana\nAvenue");
  gameBoard[24] = new ColorGroupProperty(240, "Red", "Illinois\nAvenue"); 
  gameBoard[25] = new Railroad("B&O RR", 200);
  gameBoard[26] = new ColorGroupProperty(260, "Yellow", "Atlantic\nAvenue");
  gameBoard[27] = new ColorGroupProperty(260, "Yellow", "Ventnor\nAvenue");
  gameBoard[28] = new UtilitySpace(150, "Water \nWorks");
  gameBoard[29] = new ColorGroupProperty(280, "Yellow", "Marvin\nGardens");
  gameBoard[30] = new BlankSpace("Go to \njail");
  gameBoard[31] = new ColorGroupProperty(300, "Green", "Pacific Avenue");
  gameBoard[32] = new ColorGroupProperty(300, "Green", "N.C. Avenue");
  gameBoard[33] = new CardSpace("Community \nChest", communityChest);
  gameBoard[34] = new ColorGroupProperty(300, "Green", "Penn. Avenue");
  gameBoard[35] = new Railroad("Short Line RR", 200);
  gameBoard[36] = new CardSpace("Chance", chance);
  gameBoard[37] = new ColorGroupProperty(350, "Blue", "Park Place");
  gameBoard[38] = new TaxSpace("Luxury Tax", 100);
  gameBoard[39] = new ColorGroupProperty(400, "Blue", "Boardwalk");


}



void draw() {
  fill(210, 229, 210);
  rect(0, 0, 650, 650);
  
  fill(255, 255, 255);
  rect(100, 100, 550, 150);
  
  
  for (int i = 0; i < gameBoard.length; i++){
    if (gameBoard[i] != null) {
    //top left corner, z is orientation
    int z = i/10 + 1;
    gameBoard[i].draw(X[i], Y[i], z); 
  }
  }
  
  
  

  
}

}
