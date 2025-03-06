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

  // File file = await File('input.txt').create();
  // file.openWrite();
  // file.writeAsStringSync(reader.readLineSync()! + '\n');
  // file.writeAsStringSync(reader.readLineSync()! + '\n', mode: FileMode.append);
  // file.writeAsStringSync(reader.readLineSync()!, mode: FileMode.append);
  // file.openRead();
  // final output = await file.readAsLines();
  //
  // final result =
  //     getHardestLetter(int.parse(output[0]), output[1], output[2].split(' ').map((str) => int.parse(str)).toList());
  // writer.writeln(result);

  final result = getHardestLetter(
    int.parse(reader.readLineSync() ?? '0'),
    reader.readLineSync() ?? '',
    reader.readLineSync()?.split(' ').map((str) => int.parse(str)).toList() ?? [],
  );
  writer.writeln(result);
  writer.writeln(getHardestLetter(3, 'abc', [10, 11, 12]));
  writer.writeln(getHardestLetter(3, 'adc', [1, 5, 7]));
  writer.writeln(getHardestLetter(4, 'bcda', [1, 2, 4, 6]));
  writer.writeln(getHardestLetter(5, 'aabqc', [1, 3, 5, 7, 7]));
}
