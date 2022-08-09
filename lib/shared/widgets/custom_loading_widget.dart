import 'package:flutter/material.dart';

Future<void> showCustomLoadingWidget(BuildContext context, [String? message]) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white,
        child: Container(
          margin: const EdgeInsets.all(13),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(
                backgroundColor: Color.fromRGBO(41, 222, 146, 1),
                color: Colors.white,
              ),
              const SizedBox(width: 26),
              Expanded(child: Text(message ?? 'Loading...')),
            ],
          ),
        ),
      );
    },
  );
}
