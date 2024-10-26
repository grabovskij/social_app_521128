import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/data/sources/post_data_source/post_data_source.dart';
import 'package:social/features/posts/blocs/post_cubit/posts_states.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostDataSource dataSource;

  var _page = 0;

  PostsCubit({
    required this.dataSource,
  }) : super(PostsLoadingState());

  Future<void> getFirstPostsChunk() async {
    _page = 0;

    emit(PostsLoadingState());

    try {
      final postsData = await dataSource.getPosts(page: _page);

      if (postsData.data.isEmpty) {
        emit(PostsEmptyState());

        return;
      }

      emit(PostsLoadedState(postsData.data));
    } on Object {
      emit(PostsErrorState(
        message: 'Что-то пошло не так...',
      ));
    }
  }
}
