import 'package:flutter/material.dart';
import 'package:pro_cris_flutter/components/atoms/button.dart';
import 'package:pro_cris_flutter/components/templates/pro_cris_modal.dart';
import 'package:pro_cris_flutter/styles/pro_cris_colors.dart';
import 'package:pro_cris_flutter/styles/pro_cris_font_sizes.dart';

class ProCrisAlertResult {
  ProCrisAlertResult({
    this.isConfirmed = false,
    this.isCancelled = false,
    this.isDismissed = true,
  });
  bool isConfirmed;
  bool isCancelled;
  bool isDismissed;

  void cancel() {
    isCancelled = true;
    isDismissed = true;
  }

  void confirm() {
    isConfirmed = true;
    isDismissed = false;
  }
}

class ProCrisAlert {
  static Future<ProCrisAlertResult> show({
    required BuildContext context,
    required String title,
    required String content,
    String? confirmText,
    String? cancelText,
  }) async {
    final result = ProCrisAlertResult();
    await showDialog(
      context: context,
      builder: (context) {
        return ProCrisModal(
          children: [
            ProCrisModalHeader(title: title, transparentBackground: true),
            ProCrisModalBody(
              child: Text(
                content,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: ProCrisFontSizes.fontMd,
                ),
              ),
            ),
            ProCrisModalFooter(
              children: [
                Button.sizeSm(
                  color: ProCrisColors.gray,
                  title: cancelText ?? 'Cancelar',
                  onPressed: () {
                    result.cancel();
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(width: 8),
                Button.sizeSm(
                  color: ProCrisColors.red,
                  title: confirmText ?? 'Confirmar',
                  onPressed: () {
                    result.confirm();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
    return result;
  }
}
