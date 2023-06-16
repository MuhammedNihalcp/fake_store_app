// ignore: must_be_immutable
import 'package:flutter/material.dart';

import '../../../constant/colors.dart';
import '../../../constant/size.dart';
import '../../../controller/product_controller.dart';

// ignore: must_be_immutable
class GridPhotoAndRatingWidget extends StatelessWidget {
  GridPhotoAndRatingWidget({
    super.key,
    required this.height,
    required this.data,
    required this.index,
  });

  final double height;
  ProductController data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: height * 0.23,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(data.productList[index].image),
            ),
          ),
        ),
        Positioned(
          left: 10,
          bottom: 10,
          child: Container(
            height: height * 0.04,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(width: 1, color: greyColor),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      data.productList[index].rating.rate.toString(),
                      style: const TextStyle(
                        color: blackColor,
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      color: greenColor,
                      size: 15,
                    )
                  ],
                ),
                kWidth5,
                const VerticalDivider(
                  color: greyColor,
                  thickness: 1,
                ),
                kWidth5,
                Text(
                  '${data.productList[index].rating.count}k',
                  style: const TextStyle(
                    color: blackColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
