
class Card {

  private String description;
  private int moneyChange;
  private int destination;
  private boolean goToJail;

  Card(String desc, int money, int dest, boolean jail) {
    description = desc;
    moneyChange = money;
    destination = dest;
    goToJail = jail;
  }

  String getDescription() {
    return description;
  }

  int getMoneyChange() {
    return moneyChange;
  }

  int getDestination() {
    return destination;
  }

  boolean goesToJail() {
    return goToJail;
  }
}
