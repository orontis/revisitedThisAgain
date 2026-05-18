class TaxSpace extends Space{
  private int taxAmount;
  
  TaxSpace(String n, int t) {
    super(n);
    taxAmount = t;
    }
  
  int getTax() {
    return taxAmount;
  }
}
