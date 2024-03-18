import 'dart:ui';

import 'models/search_response/info.dart';

class Utils {
  static const authInfoKey = "auth_info";
}

extension DateTimeExtension on DateTime {
  String differenceString() {
    DateTime now = DateTime.now();
    final difference = now.difference(this);
    int inSeconds = now.difference(this).inSeconds;
    if (inSeconds < 60) {
      return "$difference초";
    }
    final inMinutes = difference.inMinutes;
    if (inMinutes < 60) {
      return "$inMinutes분";
    }
    final inHours = difference.inHours;
    if (inHours < 24) {
      return "$inHours시간";
    }
    final inDays = difference.inDays;
    if (inDays < 30) {
      return "$inDays일";
    }
    if (inDays < 365) {
      return "${(inDays / 30).round()}개월";
    }
    return "${(inDays / 365).round()}년";
  }
}

extension StringExtension on String {
  Color? toColor() {
    try {
      final buffer = StringBuffer();
      if (length == 6 || length == 7) buffer.write('ff');
      buffer.write(replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (_) {
      return null;
    }
  }

  SearchType? toSearchType() {
    if (this == SearchType.code.value) {
      return SearchType.code;
    }
    if (this == SearchType.repositories.value) {
      return SearchType.repositories;
    }
    if (this == SearchType.issues.value) {
      return SearchType.issues;
    }
    if (this == SearchType.pullRequest.value) {
      return SearchType.pullRequest;
    }
    if (this == SearchType.users.value) {
      return SearchType.users;
    }
    if (this == SearchType.organizations.value) {
      return SearchType.organizations;
    }
    return null;
  }
}

extension IntExtension on int {
  String shortened() {
    if (this < 1000) {
      return "$this";
    }
    if (this < 1000000) {
      return "${(this / 1000).toStringAsFixed(1)}K";
    }
    if (this < 1000000000) {
      return "${(this / 1000000).toStringAsFixed(1)}M";
    }
    if (this < 1000000000000) {
      return "${(this / 1000000000).toStringAsFixed(1)}B";
    }
    return "${(this / 1000000000000).toStringAsFixed(1)}T";
  }
}
