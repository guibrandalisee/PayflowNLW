import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextInputType? keyboardType;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value) onChanged;

  const InputTextWidget(
      {Key? key,
      required this.label,
      required this.icon,
      this.initialValue,
      this.validator,
      this.controller,
      required this.onChanged,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.left,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            TextFormField(
              onChanged: onChanged,
              keyboardType: keyboardType,
              controller: controller,
              validator: validator,
              initialValue: initialValue,
              style: TextStyles.input,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  labelText: label,
                  labelStyle: TextStyles.input,
                  border: InputBorder.none,
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Icon(
                          icon,
                          color: AppColors.primary,
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 48,
                        color: AppColors.stroke,
                      )
                    ],
                  )),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.stroke,
            )
          ],
        ),
      ),
    );
  }
}