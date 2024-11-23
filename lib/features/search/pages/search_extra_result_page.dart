import 'package:flutter/material.dart';

class SearchExtra {
  final String query;

  SearchExtra({required this.query});
}

class SearchExtraResultPage extends StatelessWidget {
  final SearchExtra extra;

  const SearchExtraResultPage({
    required this.extra,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchExtraResultPage'),
      ),
      body: Center(
        child: Text(extra.query),
      ),
    );
  }
}
