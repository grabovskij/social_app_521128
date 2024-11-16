import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social/configuration/navigation/app_routes.dart';
import 'package:social/configuration/navigation/menu_shell_widget.dart';
import 'package:social/features/posts/pages/posts_page.dart';

abstract class AppRouterConfiguration {
  static GoRouter createRouter() {
    return GoRouter(
      initialLocation: AppRoutes.root.path,
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, child) => MenuShellWidget(child: child),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  name: AppRoutes.root.name,
                  path: AppRoutes.root.path,
                  builder: (context, state) => const PostsPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  name: AppRoutes.profile.name,
                  path: AppRoutes.profile.path,
                  builder: (context, state) => const Scaffold(
                    body: Text('Second page'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
