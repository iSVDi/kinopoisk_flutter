enum SortOrder {
  rating("RATING"),
  year("YEAR");

  const SortOrder(this.value);
  final String value;

  @override
  String toString() => value;
}
