import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social/configuration/navigation/app_routes.dart';
import 'package:social/features/search/pages/search_extra_result_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController _searchTextController;

  @override
  void initState() {
    super.initState();

    _searchTextController = TextEditingController(text: 'asd');
  }

  @override
  void dispose() {
    _searchTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _searchTextController,
              ),
              FilledButton(
                onPressed: () {
                  context.goNamed(
                    AppRoutes.searchResult.name,
                    queryParameters: {'q': _searchTextController.text},
                  );
                },
                child: Text('Search'),
              ),
              FilledButton(
                onPressed: () {
                  context.goNamed(
                    AppRoutes.searchExtraResult.name,
                    extra: SearchExtra(query: _searchTextController.text),
                  );
                },
                child: Text('Search with extra'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
