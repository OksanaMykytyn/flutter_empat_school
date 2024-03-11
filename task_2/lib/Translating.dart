class Translating {
  int page;
  double priceForPage;
  double money;

  Translating._internal(this.page, this.priceForPage) : money = page * priceForPage;

  factory Translating(int page, double priceForPage) {
    if(page == 0 || priceForPage == 0) {
      throw Exception("Page and price for page can not be zero");
    }

    return Translating._internal(page, priceForPage);
  }
}


