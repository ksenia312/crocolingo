import 'package:crocolingo/features/document_translation/presentation/components/document_translation_body.dart';
import 'package:crocolingo/uikit/app_bar.dart';
import 'package:crocolingo/uikit/elements/app_drawer.dart';
import 'package:flutter/material.dart';

class DocumentTranslationScreen extends StatelessWidget {
  const DocumentTranslationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar.of(
        context,
        title: const Text('Document translation'),
      ),
      drawer: const AppDrawer(),
      body: const DocumentTranslationBody(),
    );
  }
}
