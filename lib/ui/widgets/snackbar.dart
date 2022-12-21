import 'package:flutter/material.dart';
import 'package:tutorbin/ui/widgets/text.dart';

void showSnackBar(
  BuildContext context,
  String message, {
  Duration duration = const Duration(seconds: 3),
}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: duration,
        content: text(
          text: message,
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
