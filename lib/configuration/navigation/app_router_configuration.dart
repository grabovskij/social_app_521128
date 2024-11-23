import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social/configuration/navigation/app_routes.dart';
import 'package:social/configuration/navigation/menu_shell_widget.dart';
import 'package:social/features/error_page/error_page.dart';
import 'package:social/features/posts/pages/posts_page.dart';
import 'package:social/features/search/pages/search_extra_result_page.dart';
import 'package:social/features/search/pages/search_page.dart';
import 'package:social/features/search/pages/search_result_page.dart';

abstract class AppRouterConfiguration {
  static GoRouter createRouter() {
    return GoRouter(
      initialLocation: AppRoutes.root.path,
      errorBuilder: (context, state) => const ErrorPage(),
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
                  name: AppRoutes.search.name,
                  path: AppRoutes.search.path,
                  builder: (context, state) => const SearchPage(),
                  routes: [
                    GoRoute(
                      name: AppRoutes.searchResult.name,
                      path: AppRoutes.searchResult.path,
                      builder: (context, state) => SearchResultPage(
                        query: state.uri.queryParameters['q']!,
                      ),
                    ),
                    GoRoute(
                      name: AppRoutes.searchExtraResult.name,
                      path: AppRoutes.searchExtraResult.path,
                      builder: (context, state) => SearchExtraResultPage(
                        extra: state.extra! as SearchExtra,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                    name: AppRoutes.profile.name,
                    path: AppRoutes.profile.path,
                    builder: (context, state) => Scaffold(
                          body: Column(
                            children: [
                              const Text('Second page'),
                              FilledButton(
                                onPressed: () => context.goNamed(
                                  AppRoutes.profileInfo.name,
                                  pathParameters: {'id': '123'},
                                ),
                                child: const Text('123'),
                              ),
                            ],
                          ),
                        ),
                    routes: [
                      GoRoute(
                        name: AppRoutes.profileInfo.name,
                        path: AppRoutes.profileInfo.path,
                        builder: (context, state) => Scaffold(
                          body: Center(
                            child: Text(
                              '${state.pathParameters['id']}',
                              style: const TextStyle(
                                fontSize: 32,
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
