import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:neobis_smart_tailor/core/app/io_ui.dart';
import 'package:neobis_smart_tailor/core/app/widgets/alert_dialog_style.dart';
import 'package:neobis_smart_tailor/core/app/widgets/app_bar_style.dart';
import 'package:neobis_smart_tailor/features/marketplace/presentation/pages/marketplace_detail_screen/presentation/widgets/custom_dropdown_widget.dart';
import 'package:neobis_smart_tailor/features/marketplace/presentation/pages/marketplace_detail_screen/presentation/widgets/gallery_widget.dart';
import 'package:neobis_smart_tailor/gen/assets.gen.dart';
import 'package:neobis_smart_tailor/gen/strings.g.dart';

@RoutePage()
class MarketplaceDetailScreen extends StatefulWidget {
  final String title;
  final DateTime? date;
  final bool acceptOrderButton;
  final bool buyButton;
  final CustomDropdown? sizeWidget;
  const MarketplaceDetailScreen({
    required this.acceptOrderButton,
    required this.buyButton,
    required this.title,
    super.key,
    this.date,
    this.sizeWidget,
  });

  @override
  State<MarketplaceDetailScreen> createState() => _MarketplaceDetailScreenState();
}

class _MarketplaceDetailScreenState extends State<MarketplaceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildButtons(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBarStyle(title: widget.title, centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GalleryScreen(date: widget.date),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.550,
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10, left: 16, right: 16, top: 24),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetailInfo(),
                          const SizedBox(height: 24),
                          Divider(
                            height: 0.33,
                            color: AppColors.buttonUnavailableBack.withOpacity(0.6),
                          ),
                          const SizedBox(height: 20),
                          Container(child: widget.sizeWidget),
                          _buildAuthorInfo(),
                          const SizedBox(height: 24),
                          // _buildButtons(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialogStyle(
          title: 'Ваш заказ в обработке',
          content: 'Заказ отображается в вашем личном кабинете',
          buttonText: 'Понятно',
          onButtonPressed: () {
            AutoRouter.of(context).maybePop();
          },
        );
      },
    );
  }

  Column _buildButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        widget.acceptOrderButton == true
            ? ElevatedButtonWidget(
                text: t.acceptOrder,
                onTap: () {},
                color: AppColors.white,
              )
            : Container(),
        const SizedBox(height: 12),
        widget.buyButton == true
            ? ElevatedButtonWidget(
                text: t.buy,
                onTap: () {
                  _showAlertDialog();
                },
                color: AppColors.orange,
              )
            : Container(),
      ],
    );
  }

  Column _buildDetailInfo() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Профессиональные\nспицы для вязания',
              style: AppTextStyle.textField16.copyWith(fontWeight: FontWeight.w500),
            ),
            const Text(
              '1000 сом',
              style: AppTextStyle.s20w400Orange,
            )
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          style: AppTextStyle.text14.copyWith(color: AppColors.greyText),
        ),
      ],
    );
  }

  Row _buildAuthorInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              maxRadius: 32,
              backgroundImage: AssetImage(Assets.images.photo1.path),
            ),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Sandy Wilder Cheng',
                  style: AppTextStyle.textField16,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Автор объявления',
                  style: AppTextStyle.text14,
                )
              ],
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(right: AppProps.kPageMargin),
          child: Icon(
            size: 24,
            Icons.phone,
            color: AppColors.listGreen,
          ),
        )
      ],
    );
  }
}