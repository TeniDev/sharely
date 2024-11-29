import 'package:flutter/material.dart';

Future<void> startLoadingModal(BuildContext context) async {
  return await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (_) => Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: const CircularProgressIndicator(),
      ),
    ),
  );
}

Future<void> stopLoadingModal(BuildContext context) async {
  Navigator.of(context).pop();
}
