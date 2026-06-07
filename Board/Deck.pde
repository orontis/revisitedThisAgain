class Deck {
  ArrayList<Card> cards;
  private int startSize;
  
  Deck(int size) {
   cards = new ArrayList<Card>();
   startSize = size;
   for (int i = 0; i < size; i++) {
     Card current = new Card(i);
     cards.add(current);
   }
   shuffle();
  }
  
  Card drawCard() {
    if (cards.size() == 0) {
      println("Deck empty");
      return null;
    }
    Card top = cards.remove(0);
    return top;
  }
  
  void shuffle() {
    for (int i = 0; i < cards.size(); i++) {
      int rand = int(random(cards.size()));
      Card temp = cards.get(i);
      cards.set(i, cards.get(rand));
      cards.set(rand, temp);
    }
  }
  
  int getSize() {
    return cards.size();
  }
  
  
  
  
  
}
