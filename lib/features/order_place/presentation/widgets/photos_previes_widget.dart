import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:neobis_smart_tailor/core/app/io_ui.dart';
import 'package:neobis_smart_tailor/features/order_place/presentation/bloc/order_place_bloc.dart';

class PhotosPreviewWidget extends StatelessWidget {
  const PhotosPreviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderPlaceBloc, OrderPlaceState>(
      builder: (context, state) {
        final photos = state.orderPlaceModel.images;
        return photos != []
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(photos.length, (index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2, color: AppColors.fieldBorder),
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(
                                      File(photos[index]),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  right: 4,
                                  top: 4,
                                  child: GestureDetector(
                                    onTap: () {
                                      context
                                          .read<OrderPlaceBloc>()
                                          .add(OrderPlaceEvent.removePhoto(photo: photos[index]));
                                    },
                                    child: const Icon(Icons.highlight_remove, color: AppColors.white, size: 20),
                                  )),
                            ],
                          ),
                          const SizedBox(
                            width: 8,
                          )
                        ],
                      ),
                      const SizedBox(height: AppProps.kPageMargin),
                    ],
                  );
                }),
              )
            : Container();
      },
    );
  }
}