import 'package:flutter/material.dart';
import 'package:neobis_smart_tailor/core/app/io_ui.dart';
import 'package:neobis_smart_tailor/gen/assets.gen.dart';

class SubscribeContainerStyle extends StatelessWidget {
  const SubscribeContainerStyle({
    super.key,
    required this.buttonTitle,
    required this.onButtonPressed,
  });

  final String buttonTitle;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.yellow,
        borderRadius: BorderRadius.circular(AppProps.kSmallBorderRadius),
      ),
      child: Row(
        children: [
          SizedBox(
            child: Assets.images.present.image(),
          ),
          Column(
            children: [
              const SizedBox(height: AppProps.kPageMargin),
              Text(
                'Оформите подписку,\nчтобы получить больше возможностей!\nС вами свяжется наш администратор',
                style: AppTextStyle.title24.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: AppProps.kPageMargin),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.4,
                child: ElevatedButton(
                  onPressed: onButtonPressed,
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppProps.kMediumMargin),
                    child: Text(
                      buttonTitle,
                      style: AppTextStyle.textField16.copyWith(fontSize: 14),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
            ],
          ),
        ],
      ),
    );
  }
}
