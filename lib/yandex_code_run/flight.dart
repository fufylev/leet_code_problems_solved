import 'dart:io';

/// https://coderun.yandex.ru/problem/flight
/// 284. Перелёт

String toTwin(int value) {
  return value <= 10 ? '0$value' : '$value';
}

String checkFlight(String start, String end, int timeDiff) {
  String result = '';
  final startSplit = start.split(':').map((e) => int.tryParse(e) ?? 0).toList();
  final endSplit = end.split(':').map((e) => int.tryParse(e) ?? 0).toList();
  final date = DateTime.now();
  DateTime dateStart = date.copyWith(hour: startSplit.first, minute: startSplit.last, microsecond: 0, millisecond: 0);
  if (timeDiff >= 0) {
    dateStart = dateStart.add(Duration(hours: timeDiff));
  } else {
    dateStart = dateStart.subtract(Duration(hours: timeDiff));
  }
  DateTime dateEnd = date.copyWith(hour: endSplit.first, minute: endSplit.last, microsecond: 0, millisecond: 0);

  if (startSplit.first > endSplit.first) {
    dateEnd = dateEnd.add(Duration(days: 1));
  }

  final calcDiff = dateEnd.difference(dateStart);
  final hours = calcDiff.inHours;
  final inMinutes = calcDiff.inMinutes - hours * 60;

  return '${hours}:${toTwin(inMinutes)}';
}

void main() {
  var reader = stdin;
  var writer = stdout;

  // final start = reader.readLineSync();
  // final end = reader.readLineSync();
  // final timeDiff = int.tryParse(reader.readLineSync()!);
  // if (timeDiff != null && start != null && end != null) {
  //   final result = checkFlight(start, end, timeDiff);
  //   writer.writeln(result);
  // }

  writer.writeln(checkFlight('23:00', '01:05', -14));
}
