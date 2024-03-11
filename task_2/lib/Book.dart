class Book with Action {
  //title, author, year of publication, and rating
  String title;
  String author;
  int yearOfPublication;
  double? rating;
  int amontOfCopy;
  int page;
  String? genre;

  Book(
    this.title, this.yearOfPublication, this.author, this.amontOfCopy, this.page,
  );


  double showRating(){
    double rate = rating ?? 0;
    return rate;
  }

  bool isRareBook() {
    bool rare;
    rare = amontOfCopy < 100 && yearOfPublication < 1900 ? rare = true : rare = false;
    return rare;
  }

  Function convert(int maxRate){
      return (rating) => (maxRate/5)*rating;
  }

  void convertRating(int maxRate) {
    var converting = convert(maxRate);
    rating = converting(rating); 
  }

  void addGenre({String genre = 'none', String type = ''}) {
    if (type.isNotEmpty) {
      this.genre = genre + type;
    } else {
      this.genre = genre;
    }
  }

  
}

mixin Action {
  void reading() {
    print('Someone read this book');
  }
}
