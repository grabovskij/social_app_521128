import 'dart:io';

import 'package:flutter/material.dart';

class SearchResultPage extends StatelessWidget {
  final String query;

  const SearchResultPage({
    required this.query,
    super.key,
  });

  int get topSnackbarOffset {
    try {
      if (Platform.isIOS) {
        return 140;
      }

      if (Platform.isAndroid) {
        return 200;
      }

      return 200;
    } on Object {
      return 200;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchResultPage'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(query),
            FilledButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => const ModalDialog(),
              ),
              child: const Text('Modal dialog'),
            ),
            FilledButton(
              onPressed: () => showModalBottomSheet(
                context: context,
                showDragHandle: true,
                isDismissible: false,
                builder: (context) => const BottomSheetContent(),
              ),
              child: const Text('Modal bottom sheet'),
            ),
            FilledButton(
              onPressed: () => showBottomSheet(
                context: context,
                showDragHandle: true,
                builder: (context) => const BottomSheetContent(),
              ),
              child: const Text('Modal bottom sheet'),
            ),
            FilledButton(
              onPressed: () {
                final snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.sizeOf(context).height - topSnackbarOffset,
                    left: 16,
                    right: 16,
                  ),
                  content: Text('Some text'),
                );

                ScaffoldMessenger.of(context)
                  ..clearSnackBars()
                  ..showSnackBar(snackBar);
              },
              child: const Text('Show snackbar'),
            )
          ],
        ),
      ),
    );
  }
}

class ModalDialog extends StatelessWidget {
  const ModalDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Hello!'),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 100,
      child: Placeholder(),
    );
  }
}
