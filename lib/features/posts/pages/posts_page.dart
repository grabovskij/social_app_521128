import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:social/data/sources/post_data_source/post_data_source.dart';
import 'package:social/features/posts/widgets/post_preview_card.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late PostDataSource postDataSource;

  @override
  void initState() {
    super.initState();

    final baseOption = BaseOptions(
      baseUrl: 'https://dummyapi.io/data/v1/',
      headers: {'app-id': '652a56c27041f5843719941b'},
    );

    final dio = Dio(baseOption);

    postDataSource = PostDataSource(dio);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: postDataSource.getPosts(page: 10),
        builder: (context, snapshot) {
          final data = snapshot.data;

          if (data != null) {
            final posts = data.data;

            return CustomScrollView(
              slivers: [
                SliverList.separated(
                  itemCount: posts.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: PostPreviewCard(
                      post: posts[index],
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: FilledButton(
                      onPressed: () {},
                      child: const Text('Загрузить еще'),
                    ),
                  ),
                )
              ],
            );
          }

          final error = snapshot.error;

          if (error != null) {
            return Center(
              child: Text('$error'),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
