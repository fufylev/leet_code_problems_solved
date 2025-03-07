import 'dart:io';

/// 272. Простая подсказка
/// https://coderun.yandex.ru/problem/simple-suggest?compiler=dart
///

String getSimpleSuggest(int count, List<String> list) {
  if (list.isEmpty || count <= 0) return '';

  String result = list[0][0];
  int maxInt = 1;
  Map<String, int> hashMap = {list[0][0]: 1};

  for (int i = 1; i < count; i++) {
    final current = list[i];
    final firstLetter = current[0];

    if (hashMap.containsKey(firstLetter)) {
      final currentValue = (hashMap[firstLetter] ?? 0) + 1;
      hashMap.update(firstLetter, (value) => currentValue);
      if (currentValue > maxInt) {
        maxInt = currentValue;
        result = firstLetter;
      }
    } else {
      hashMap.putIfAbsent(firstLetter, () => 1);
    }
  }

  return result;
}

void main() async {
  Stdin reader = stdin;
  Stdout writer = stdout;

  final n = int.parse(reader.readLineSync() ?? '0');

  List<String> list = [];

  for (int i = 0; i < n; i++) {
    list.add(reader.readLineSync()!);
  }

  final result = getSimpleSuggest(n, list);
  writer.writeln(result);
  // writer.writeln(getSimpleSuggest(
  //   5,
  //   [
  //     'sayHello',
  //     'println',
  //     'sleep',
  //     'spendMoney',
  //     'log',
  //   ],
  // ));
  //
  // writer.writeln(getSimpleSuggest(
  //   5,
  //   [
  //     'dedede',
  //     'drrdr',
  //     'qwqw',
  //     'qqqqq',
  //     'dddddd',
  //   ],
  // ));
}
