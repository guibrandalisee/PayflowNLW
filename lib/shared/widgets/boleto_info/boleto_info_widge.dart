import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class BoletoInfoWidget extends StatelessWidget {
  final int size;
  const BoletoInfoWidget({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Image.asset(
              AppImages.logomini,
              color: AppColors.background,
              width: 56,
              height: 34,
            ),
          ),
          Container(
            width: 1,
            height: 52,
            color: AppColors.background,
          ),
          Text.rich(TextSpan(
            text: "Você tem ",
            style: TextStyles.captionBackground,
            children: [
              TextSpan(
                text: "$size boletos\n",
                style: TextStyles.captionBoldBackground,
              ),
              TextSpan(
                text: "cadastrados para pagar",
                style: TextStyles.captionBackground,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
