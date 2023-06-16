import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant/colors.dart';
import '../../../constant/size.dart';
import '../../../controller/product_controller.dart';

class FilterBottomSheet {
  Future<dynamic> filterBottomSheet(BuildContext context, double height) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        width: double.infinity,
        height: height * 0.3,
        color: whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'SORT BY',
                style: TextStyle(
                  color: blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              kHeight10,
              const Divider(
                color: greyColor,
                thickness: 1,
              ),
              Consumer<ProductController>(
                builder: (context, value, child) => TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        side: BorderSide(color: greyColor),
                      ),
                    ),
                  ),
                  onPressed: () {
                    value.highToLowFilterList();
                  },
                  child: const Text(
                    'Price: High to Low',
                    style: TextStyle(color: blackColor),
                  ),
                ),
              ),
              Consumer<ProductController>(builder: (context, data, child) {
                return TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        side: BorderSide(color: greyColor),
                      ),
                    ),
                  ),
                  onPressed: () {
                    data.lowToHighFilterList();
                  },
                  child: const Text(
                    'Price: Low to High',
                    style: TextStyle(color: blackColor),
                  ),
                );
              }),
              Consumer<ProductController>(builder: (context, data, child) {
                return TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        side: BorderSide(color: greyColor),
                      ),
                    ),
                  ),
                  onPressed: () {
                    data.consumerRatingFilterList();
                  },
                  child: const Text(
                    'Customer Rating',
                    style: TextStyle(color: blackColor),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
