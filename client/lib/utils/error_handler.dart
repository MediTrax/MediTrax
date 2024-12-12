import 'package:flutter/material.dart';

class ErrorHandler {
  static String _formatGraphQLError(dynamic error) {
    if (error.toString().contains('GraphQLError')) {
      final errorStr = error.toString();
      final messageStart = errorStr.indexOf('message: ') + 9;
      final messageEnd = errorStr.indexOf(',', messageStart);
      if (messageStart != -1 && messageEnd != -1) {
        return errorStr.substring(messageStart, messageEnd).trim();
      }
    }
    return error.toString();
  }

  static void showErrorSnackBar(
    BuildContext context,
    dynamic error, {
    String prefix = '错误: ',
    Duration? duration,
  }) {
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$prefix${_formatGraphQLError(error)}'),
        backgroundColor: Colors.red[400],
        duration: duration ?? const Duration(seconds: 4),
      ),
    );
  }

  static Future<void> showErrorDialog(
    BuildContext context,
    dynamic error, {
    String title = '错误',
    String? message,
    String buttonText = '确定',
  }) async {
    if (!context.mounted) return;

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message ?? _formatGraphQLError(error)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
