import 'package:fake_store_app/constant/colors.dart';
import 'package:fake_store_app/constant/size.dart';
import 'package:fake_store_app/controller/product_controller.dart';
import 'package:fake_store_app/screens/product_view/widget/bottom_sheet_widget.dart';
import 'package:fake_store_app/screens/product_view/widget/grid_image_and_rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenProduct extends StatelessWidget {
  const ScreenProduct({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        elevation: 10,
        title: const Text(
          'SHOP',
          style: TextStyle(
            color: blackColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              FilterBottomSheet().filterBottomSheet(context, height);
            },
            icon: const Icon(
              Icons.filter_list_outlined,
              color: blackColor,
            ),
          )
        ],
      ),
      body: Consumer<ProductController>(builder: (context, data, child) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            childAspectRatio: 1 / 1.5,
          ),
          itemBuilder: (context, index) {
            return Container(
              width: width * 0.5,
              decoration: BoxDecoration(
                border: Border.all(color: greyColor, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GridPhotoAndRatingWidget(
                    height: height,
                    data: data,
                    index: index,
                  ),
                  kHeight10,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.35,
                          child: Text(
                            data.productList[index].title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: blackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        data.isLike == false
                            ? GestureDetector(
                                onTap: () {
                                  data.changeLikeColor();
                                },
                                child: const Icon(
                                  Icons.favorite_border,
                                  color: blackColor,
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  data.changeLikeColor();
                                },
                                child: const Icon(
                                  Icons.favorite_sharp,
                                  color: redColor,
                                ),
                              ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      data.productList[index].description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: greyColor, fontSize: 13),
                    ),
                  ),
                  kHeight5,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '\$${data.productList[index].price.toString()}',
                      style: const TextStyle(
                        color: blackColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          itemCount: data.productList.length,
        );
      }),
    );
  }
}
