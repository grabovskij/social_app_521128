import 'package:dio/dio.dart';
import 'package:social/data/sources/post_data_source/mappers/response_mapper.dart';
import 'package:social/data/sources/post_data_source/models/response_dto.dart';
import 'package:social/domain/models/pager.dart';
import 'package:social/domain/models/post_preview.dart';

class PostDataSource {
  final Dio _dio;

  const PostDataSource(this._dio);

  Future<Pager<PostPreview>> getPosts({
    int? page,
    int? limit,
  }) async {
    final response = await _dio.get(
      '/post',
      queryParameters: {
        if (page != null) 'page': page,
        if (limit != null) 'limit': limit,
      },
    );

    return ResponseDto.fromJson(response.data).toEntity();
  }
}
