import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../../utils/utils.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    super.key,
    required this.label,
    this.onPressed,
    this.isDisabled = false,
  });

  final String label;
  final bool isDisabled;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = SizerUtil(context: context);

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: size.height(.06),
        maxHeight: size.height(.06),
        maxWidth: size.width(.9),
        minWidth: size.width(.9),
      ),
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          disabledBackgroundColor: theme.colorScheme.scrim,
          overlayColor: theme.colorScheme.onSurfaceVariant,
          padding: size.symmetric(.2, .02),
          shape: RoundedRectangleBorder(
            borderRadius: size.borderRadius(.02),
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: isDisabled ? null : AppColors.white,
          ),
        ),
      ),
    );
  }
}
