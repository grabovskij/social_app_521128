import 'package:equatable/equatable.dart';
import 'package:social/domain/models/user_preview.dart';

class PostPreview extends Equatable {
  final String id;
  final String text;
  final String image;
  final int likes;
  final List<String> tags;
  final DateTime publishDate;
  final UserPreview owner;

  const PostPreview({
    required this.id,
    required this.text,
    required this.image,
    required this.likes,
    required this.tags,
    required this.publishDate,
    required this.owner,
  });

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      text,
      image,
      likes,
      tags,
      publishDate,
      owner,
    ];
  }
}
