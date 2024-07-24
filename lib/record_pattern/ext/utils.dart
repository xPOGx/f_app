const week = 7;
const month = 28;
const year = 365;

String formatDate(DateTime dateTime) {
  final today = DateTime.now();
  final difference = dateTime.difference(today);

  return switch (difference) {
    Duration(inDays: 0) => 'today',
    Duration(inDays: 1) => 'tomorrow',
    Duration(inDays: -1) => 'yesterday',
    Duration(inDays: final days) when days > year =>
      '${days ~/ year} years, ${days % year ~/ month} months, ${days % week ~/ week} weeks from now',
    Duration(inDays: final days) when days < -year =>
      '${days.abs() ~/ year} years, ${days.abs() % year ~/ month} months, ${days.abs() % week ~/ week} weeks ago',
    Duration(inDays: final days) when days > month =>
      '${days ~/ month} months, ${days % week ~/ week} weeks from now',
    Duration(inDays: final days) when days < -month =>
      '${days.abs() ~/ month} months, ${days.abs() ~/ week} weeks ago',
    Duration(inDays: final days) when days % week > week =>
      '${days ~/ week} weeks from now',
    Duration(inDays: final days) when days < -week =>
      '${days.abs() ~/ week} weeks ago',
    Duration(inDays: final days, isNegative: true) => '${days.abs()} days ago',
    Duration(inDays: final days) => '$days days from now',
  };
}
