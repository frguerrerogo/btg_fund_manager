class Fund {

  const Fund({
    required this.id,
    required this.name,
    required this.minimumAmount,
    required this.currency,
    required this.category,
  });
  final int id;
  final String name;
  final double minimumAmount;
  final String currency;
  final String category;
}
