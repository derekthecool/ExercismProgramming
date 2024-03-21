bool isValid(String isbn) {
  var numbers = RegExp(r'[0-9Xx]').allMatches(isbn).map((match) {
    String matchedValue = match.group(0)!;
    return int.parse(matchedValue.toUpperCase() == 'X' ? '10' : matchedValue);
  }).toList();

  var list = [for (var i = 10; i > 0; i -= 1) i];

  List<int> isbnSum = [];
  for (int i = 0; i < numbers.length; i++) {
    isbnSum.add(numbers[i] * list[i]);
  }

  print(numbers);
  print(list);
  print(isbnSum);

  var totalSum = isbnSum.fold(0, (int x, int y) => x + y);
  print(totalSum);

  return totalSum % 11 == 0;
}
