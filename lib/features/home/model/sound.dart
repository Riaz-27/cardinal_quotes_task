import 'dart:convert';

import 'package:flutter/foundation.dart';

class Sound {
  final String title;
  final String imageUrl;
  final String views;
  final List<String> tags;
  Sound({
    required this.title,
    required this.imageUrl,
    required this.views,
    required this.tags,
  });

  Sound copyWith({
    String? title,
    String? imageUrl,
    String? views,
    List<String>? tags,
  }) {
    return Sound(
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

  factory Sound.fromMap(Map<String, dynamic> map) {
    return Sound(
      title: map['title'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      views: map['views'] ?? '',
      tags: List<String>.from((map['tags'] ?? [])),
    );
  }

  String toJson() => json.encode(toMap());

  factory Sound.fromJson(String source) =>
      Sound.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Sound(title: $title, imageUrl: $imageUrl, views: $views, tags: $tags)';
  }

  @override
  bool operator ==(covariant Sound other) {
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
