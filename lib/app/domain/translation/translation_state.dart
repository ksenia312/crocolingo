import 'package:crocolingo/common/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

abstract class TranslationState<Input, Result> {
  TranslationState({this.value});

  static Widget buildDefaultLoading(BuildContext context, String? status) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            status ?? '',
            style: context.textTheme.titleMedium.withColor(
              context.colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          const CircularProgressIndicator.adaptive(),
        ],
      ),
    );
  }

  static Widget buildDefaultError(BuildContext context, String error) {
    return Text(
      error,
      style: context.textTheme.bodyLarge.withColor(
        context.colorScheme.error,
      ),
    );
  }

  final Input? value;

  bool get isLoading;

  bool get isIdle;

  bool get isResult;

  bool get isError;

  Result resultBuilder();

  String errorBuilder();

  String? loadingBuilder();

  Widget when({
    required Widget Function() onIdle,
    required Widget Function(String? status) onLoading,
    required Widget Function(Result result) onResult,
    required Widget Function(String error) onError,
  }) {
    if (isLoading) {
      return onLoading(loadingBuilder());
    } else if (isResult) {
      return onResult(resultBuilder());
    } else if (isError) {
      return onError(errorBuilder());
    }
    return onIdle();
  }
}
