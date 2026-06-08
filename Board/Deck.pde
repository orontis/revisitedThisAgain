class Deck {
  ArrayList<Card> cards;
  private int startSize;
  
  Deck() {
   cards = new ArrayList<Card>();
   cards.add(new Card("Bank error. Collect $200", 200, -1, false));
   cards.add(new Card("Doctor's fee. Pay $50", -50, -1, false));
   cards.add(new Card("Advance to GO", 0, 0, false));
   cards.add(new Card("Go to Jail", 0, -1, true));
   cards.add(new Card("Collect $100", 100, -1, false));
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
