import 'package:equatable/equatable.dart';

class Pager<T> extends Equatable {
  final List<T> data;
  final int total;
  final int page;
  final int limit;

  const Pager({
    required this.data,
    required this.total,
    required this.page,
    required this.limit,
  });

  @override
  List<Object?> get props {
    return [
      data,
      total,
      page,
      limit,
    ];
  }

  Pager<T> copyWith({
    List<T>? data,
    int? total,
    int? page,
    int? limit,
  }) {
    return Pager(
      data: data??this.data,
      total: total ?? this.total,
      page: page ?? this.page,
      limit: limit ?? this.limit,
    );
  }
}
