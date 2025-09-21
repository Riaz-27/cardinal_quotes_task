// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Wallpaper {
  final String title;
  final String imageUrl;
  final String views;
  final List<String> tags;
  Wallpaper({
    required this.title,
    required this.imageUrl,
    required this.views,
    required this.tags,
  });

  Wallpaper copyWith({
    String? title,
    String? imageUrl,
    String? views,
    List<String>? tags,
  }) {
    return Wallpaper(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      views: views ?? this.views,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'imageUrl': imageUrl,
      'views': views,
      'tags': tags,
    };
  }

  factory Wallpaper.fromMap(Map<String, dynamic> map) {
    return Wallpaper(
      title: map['title'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      views: map['views'] ?? '',
      tags: List<String>.from((map['tags'] ?? [])),
    );
  }

  String toJson() => json.encode(toMap());

  factory Wallpaper.fromJson(String source) =>
      Wallpaper.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Wallpaper(title: $title, imageUrl: $imageUrl, views: $views, tags: $tags)';
  }

  @override
  bool operator ==(covariant Wallpaper other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.imageUrl == imageUrl &&
        other.views == views &&
        listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return title.hashCode ^ imageUrl.hashCode ^ views.hashCode ^ tags.hashCode;
  }
}
