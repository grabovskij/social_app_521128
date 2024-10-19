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
}
