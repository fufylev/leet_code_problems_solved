import 'dart:io';
/*
  180. Самая сложная буква
  https://coderun.yandex.ru/problem/hardest-letter?compiler=dart
*/

String getHardestLetter(int n, String string, List<int> timeline) {
  if (n == 0 || timeline.isEmpty) return '';

  String hardestLetter = string[0];
  int hardestTime = timeline[0];
  int prevTime = timeline[0];

  for (int i = 1; i < n; i++) {
    final nextTime = timeline[i] - prevTime;
    if (nextTime >= hardestTime) {
      hardestTime = nextTime;
      hardestLetter = string[i];
    }
    prevTime = timeline[i];
  }

  return hardestLetter;
}

void main() async {
  Stdin reader = stdin;
  Stdout writer = stdout;

  final result = getHardestLetter(
    int.parse(reader.readLineSync() ?? '0'),
    reader.readLineSync() ?? '',
    reader.readLineSync()?.split(' ').map((str) => int.parse(str)).toList() ?? [],
  );
  writer.writeln(result);
  writer.writeln(getHardestLetter(3, 'abc', [10, 11, 12])); // => a
  writer.writeln(getHardestLetter(3, 'adc', [1, 5, 7])); // => d
  writer.writeln(getHardestLetter(4, 'bcda', [1, 2, 4, 6])); // => a
  writer.writeln(getHardestLetter(5, 'aabqc', [1, 3, 5, 7, 7])); // => q
}
