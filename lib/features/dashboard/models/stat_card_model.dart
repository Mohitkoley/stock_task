class StatCardModel {
  final String title;
  final String value;
  final String changePercent;
  final bool isPositive;
  final bool isBlue; // Blue gradient or dark card

  StatCardModel({
    required this.title,
    required this.value,
    required this.changePercent,
    required this.isPositive,
    required this.isBlue,
  });
}
