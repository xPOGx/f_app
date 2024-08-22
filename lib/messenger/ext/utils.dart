String formatDate(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  return switch (difference) {
    Duration(inDays: final value) when value >= 365 => '${value / 365}' "y",
    Duration(inDays: final value) when value >= 28 => '${value / 28}' "m",
    Duration(inDays: final value) when value >= 7 => '${value / 7}' "w",
    Duration(inDays: final value) when value > 0 => '$value' "d",
    Duration(inHours: final value) when value > 0 => '$value' 'h',
    Duration(inMinutes: final value) when value > 0 => '$value' 'min',
    Duration(inSeconds: final value) when value > 0 => '$value' 'sec',
    Duration() => 'Now',
  };
}
