import 'dart:convert';

import 'package:cardinal_quotes_task/core/constants/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class Quotes {
  final String title;
  final String? imageUrl;
  final Color? color;
  final String? quoteText;
  final String views;
  final List<String> tags;
  final bool isSaved;
  Quotes({
    required this.title,
    this.imageUrl,
    this.color,
    this.quoteText,
    required this.views,
    required this.tags,
    required this.isSaved,
  });

  Quotes copyWith({
    String? title,
    String? imageUrl,
    Color? color,
    String? quoteText,
    String? views,
    List<String>? tags,
    bool? isSaved,
  }) {
    return Quotes(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      color: color ?? this.color,
      quoteText: quoteText ?? this.quoteText,
      views: views ?? this.views,
      tags: tags ?? this.tags,
      isSaved: isSaved ?? this.isSaved,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'imageUrl': imageUrl ?? '',
      'color': color == null ? const Color(0xFFFFCACA) : rgbToHex(color!),
      'quoteText': quoteText ?? '',
      'views': views,
      'tags': tags,
      'isSaved': isSaved,
    };
  }

  factory Quotes.fromMap(Map<String, dynamic> map) {
    return Quotes(
      title: map['title'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      color: map['color'] == null
          ? const Color(0xFFFFCACA)
          : hexToRgb(map['color']),
      quoteText: map['quoteText'] ?? '',
      views: map['views'] ?? '',
      tags: List<String>.from((map['tags'] ?? [])),
      isSaved: map['isSaved'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Quotes.fromJson(String source) =>
      Quotes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Quotes(title: $title, imageUrl: $imageUrl, color: $color, quoteText: $quoteText, views: $views, tags: $tags)';
  }

  @override
  bool operator ==(covariant Quotes other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.imageUrl == imageUrl &&
        other.color == color &&
        other.quoteText == quoteText &&
        other.views == views &&
        listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        imageUrl.hashCode ^
        color.hashCode ^
        quoteText.hashCode ^
        views.hashCode ^
        tags.hashCode;
  }
}
