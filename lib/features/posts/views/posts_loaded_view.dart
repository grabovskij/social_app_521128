import 'package:flutter/material.dart';
import 'package:social/domain/models/post_preview.dart';
import 'package:social/features/posts/widgets/post_preview_card.dart';

class PostsLoadedView extends StatelessWidget {
  final List<PostPreview> posts;

  const PostsLoadedView({
    required this.posts,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          separatorBuilder: (context, index) => const SizedBox(height: 16),
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
}
