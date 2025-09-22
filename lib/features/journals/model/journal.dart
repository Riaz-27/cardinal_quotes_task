import 'dart:convert';

class Journal {
  final String title;
  final String note;
  final String backgroundColor;
  final String textColor;
  Journal({
    required this.title,
    required this.note,
    required this.backgroundColor,
    required this.textColor,
  });

  Journal copyWith({
    String? title,
    String? note,
    String? backgroundColor,
    String? textColor,
  }) {
    return Journal(
      title: title ?? this.title,
      note: note ?? this.note,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'note': note,
      'backgroundColor': backgroundColor,
      'textColor': textColor,
    };
  }

  factory Journal.fromMap(Map<String, dynamic> map) {
    return Journal(
      title: map['title'] ?? '',
      note: map['note'] ?? '',
      backgroundColor: map['backgroundColor'] ?? '',
      textColor: map['textColor'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Journal.fromJson(String source) =>
      Journal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Journal(title: $title, note: $note, backgroundColor: $backgroundColor, textColor: $textColor)';
  }

  @override
  bool operator ==(covariant Journal other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.note == note &&
        other.backgroundColor == backgroundColor &&
        other.textColor == textColor;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        note.hashCode ^
        backgroundColor.hashCode ^
        textColor.hashCode;
  }
}
