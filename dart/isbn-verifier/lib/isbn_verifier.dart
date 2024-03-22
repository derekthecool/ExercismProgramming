bool isValid(String isbn) {
  return RegExp(r'[0-9X]')
      .allMatches(isbn)
      .map((match) => int.parse(match.group(0)! == 'X' ? '10' : match.group(0)!))
      .toList()
      .asMap()
      .entries
      .map((entry) => entry.value * (10 - entry.key))
      .fold(0, (int sum, int element) => sum + element) % 11 == 0;
}
