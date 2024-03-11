class CarNumber {
  CarNumber({
    required String region,
    required int number,
    required String series,
  }):
  _region = region, 
  _number = number, 
  _series = series;

  final String _region;
  final int _number;
  final String _series;

  String get region => _region;
  int get number => _number;
  String get series => _series;

  @override
  String toString() {
    return '$region $number $series';
  }
}