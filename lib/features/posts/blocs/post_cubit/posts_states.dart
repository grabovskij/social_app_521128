import 'package:social/domain/models/post_preview.dart';

sealed class PostsState {}

class PostsLoadingState extends PostsState {}

class PostsEmptyState extends PostsState {}

class PostsLoadedState extends PostsState {
  final List<PostPreview> posts;

  PostsLoadedState(this.posts);
}

class PostsNextLoadingState extends PostsState {
  final List<PostPreview> posts;

  PostsNextLoadingState({required this.posts});
}

class PostsErrorState extends PostsState {
  final String message;

  PostsErrorState({required this.message});
}

extension CounterStateMap on PostsState {
  T map<T>({
    required T Function(PostsEmptyState) empty,
    required T Function(PostsLoadingState) loading,
    required T Function(PostsLoadedState) loaded,
    required T Function(PostsNextLoadingState) nextLoading,
    required T Function(PostsErrorState) error,
  }) {
    return switch (this) {
      PostsEmptyState state => empty(state),
      PostsLoadedState state => loaded(state),
      PostsLoadingState state => loading(state),
      PostsNextLoadingState state => nextLoading(state),
      PostsErrorState state => error(state),
    };
  }

  T maybeMap<T>({
    required T Function() orElse,
    T Function(PostsEmptyState)? empty,
    T Function(PostsLoadedState)? loaded,
    T Function(PostsLoadingState)? loading,
    T Function(PostsNextLoadingState)? nextLoading,
    T Function(PostsErrorState)? error,
  }) {
    return switch (this) {
      PostsLoadingState state when loading != null => loading(state),
      PostsNextLoadingState state when nextLoading != null =>
        nextLoading(state),
      PostsEmptyState state when empty != null => empty(state),
      PostsLoadedState state when loaded != null => loaded(state),
      PostsErrorState state when error != null => error(state),
      _ => orElse(),
    };
  }
}
