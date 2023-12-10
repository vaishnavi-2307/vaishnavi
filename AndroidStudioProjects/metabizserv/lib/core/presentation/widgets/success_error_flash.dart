import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

void showErrorFlash(BuildContext context, String message) {
  showFlash(
    context: context,
    duration: const Duration(seconds: 4),
    builder: (context, controller) {
      return Flash(
        controller: controller,
        child: FlashBar(
          icon: const Icon(
            Icons.error_outline_rounded,
            color: Colors.white,
          ),
          content: Text(
            message,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          controller: controller,
        ),
      );
    },
  );
}

void showSuccessFlash(BuildContext context, String message) {
  showFlash(
    context: context,
    duration: const Duration(seconds: 4),
    builder: (context, controller) {
      return Flash(
        controller: controller,
        child: FlashBar(
          icon: const Icon(
            Icons.check_box_rounded,
            color: Colors.white,
          ),
          controller: controller,
          content: Text(
            message,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      );
    },
  );
}
