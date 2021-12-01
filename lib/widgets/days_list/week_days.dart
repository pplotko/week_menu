class Day {
  int id;
  String label;
  // String imageUrl;
  Day(this.id, this.label);
  static List <Day> week = [
    Day(1, 'Sunday'),
    Day(2, 'Monday'),
    Day(3, 'Tuesday'),
    Day(4, 'Wednesday'),
    Day(5, 'Thursday'),
    Day(6, 'Friday'),
    Day(7, 'Saturday'),
  ];
}