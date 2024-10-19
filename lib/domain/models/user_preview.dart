import 'package:equatable/equatable.dart';

class UserPreview extends Equatable {
  final String id;
  final String title;
  final String firstName;
  final String lastName;
  final String picture;

  const UserPreview({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.picture,
  });

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      title,
      firstName,
      lastName,
      picture,
    ];
  }
}
