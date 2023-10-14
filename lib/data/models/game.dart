import 'package:flutter/foundation.dart';

class Game {
  String title;
  String image;
  String description;
  List<String> tag;
  Function onTap;
  Game({
    required this.title,
    required this.image,
    required this.description,
    required this.tag,
    required this.onTap,
  });

  @override
  bool operator ==(covariant Game other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.image == image &&
        other.description == description &&
        listEquals(other.tag, tag) &&
        other.onTap == onTap;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        image.hashCode ^
        description.hashCode ^
        tag.hashCode ^
        onTap.hashCode;
  }

  Game copyWith({
    String? title,
    String? image,
    String? description,
    List<String>? tag,
    Function? onTap,
  }) {
    return Game(
      title: title ?? this.title,
      image: image ?? this.image,
      description: description ?? this.description,
      tag: tag ?? this.tag,
      onTap: onTap ?? this.onTap,
    );
  }
}
