import 'dart:convert';

import 'package:flutter/foundation.dart';

class Todo {
  final String title;
  final String repeat;
  final String endRepeat;
  final List<String> times;
  final bool isDone;
  final bool isOverdue;
  Todo({
    required this.title,
    required this.repeat,
    required this.endRepeat,
    required this.times,
    required this.isDone,
    required this.isOverdue,
  });

  Todo copyWith({
    String? title,
    String? repeat,
    String? end_repeat,
    List<String>? times,
    bool? isDone,
    bool? isOverdue,
  }) {
    return Todo(
      title: title ?? this.title,
      repeat: repeat ?? this.repeat,
      endRepeat: end_repeat ?? this.endRepeat,
      times: times ?? this.times,
      isDone: isDone ?? this.isDone,
      isOverdue: isOverdue ?? this.isOverdue,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'repeat': repeat,
      'end_repeat': endRepeat,
      'times': times,
      'isDone': isDone,
      'isOverdue': isOverdue,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      title: map['title'] ?? '',
      repeat: map['repeat'] ?? '',
      endRepeat: map['end_repeat'] ?? '',
      times: List<String>.from((map['times'] ?? [])),
      isDone: map['isDone'] ?? false,
      isOverdue: map['isOverdue'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) =>
      Todo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Todo(title: $title, repeat: $repeat, end_repeat: $endRepeat, times: $times, isDone: $isDone, isOverdue: $isOverdue)';
  }

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.repeat == repeat &&
        other.endRepeat == endRepeat &&
        listEquals(other.times, times) &&
        other.isDone == isDone &&
        other.isOverdue == isOverdue;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        repeat.hashCode ^
        endRepeat.hashCode ^
        times.hashCode ^
        isDone.hashCode ^
        isOverdue.hashCode;
  }
}
