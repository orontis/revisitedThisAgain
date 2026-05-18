class Deck {
  
ArrayList<Card> cards;
  private int startSize;
  
  Deck(int size) {
    startSize = size;
   for (int i = 0; i < size; i++) {
     Card current = new Card(i);
     cards.add(current);
   }
    
  }
  
  
  
  
  
}
