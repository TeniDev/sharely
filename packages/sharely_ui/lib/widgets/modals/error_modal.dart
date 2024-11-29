import 'package:flutter/material.dart';

import '../../utils/utils.dart';

Future<void> showErrorModal({required String error, required BuildContext context}) async {
  return await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      final theme = Theme.of(context);
      final sizer = SizerUtil(context: context);

      return Center(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: sizer.width(.1),
          ),
          child: Material(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Padding(
              padding: EdgeInsets.only(
                top: sizer.width(.05),
                left: sizer.width(.05),
                right: sizer.width(.05),
                bottom: sizer.width(.03),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        color: theme.colorScheme.tertiary,
                        size: sizer.width(.1),
                      ),
                      SizedBox(width: sizer.width(.02)),
                      Text(
                        'Error',
                        style: theme.textTheme.titleLarge,
                      ),
                    ],
                  ),
                  SizedBox(height: sizer.width(.05)),
                  Text(
                    error,
                    style: theme.textTheme.bodyMedium,
                  ),
                  SizedBox(height: sizer.width(.05)),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: theme.colorScheme.primary,
                        disabledBackgroundColor: theme.colorScheme.scrim,
                        overlayColor: theme.colorScheme.onSurfaceVariant,
                      ),
                      child: Text(
                        'Aceptar',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.surface,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
