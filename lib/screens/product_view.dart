import 'package:fake_store_app/constant/colors.dart';
import 'package:fake_store_app/constant/size.dart';
import 'package:flutter/material.dart';

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
      ),
      body: GridView.builder(
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
                GridPhotoAndRatingWidget(height: height),
                kHeight10,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'DILLINGER',
                        style: TextStyle(
                          color: blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Icon(
                        Icons.favorite_border,
                        color: blackColor,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Mesn Printed Losse T-shirt',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: greyColor, fontSize: 13),
                  ),
                ),
                kHeight5,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: RichText(
                    text: const TextSpan(
                      text: '₹ 391 ',
                      style: TextStyle(
                          color: blackColor, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: '₹1399 ',
                          style: TextStyle(
                              color: greyColor,
                              decoration: TextDecoration.lineThrough),
                        ),
                        TextSpan(
                          text: '(72%OFF)',
                          style: TextStyle(color: orangeColor),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}

class GridPhotoAndRatingWidget extends StatelessWidget {
  const GridPhotoAndRatingWidget({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: height * 0.23,
          color: Colors.blue,
        ),
        Positioned(
          left: 15,
          bottom: 15,
          child: Container(
            height: height * 0.04,
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(width: 1, color: greyColor),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      '3.9',
                      style: TextStyle(
                        color: blackColor,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: greenColor,
                      size: 15,
                    )
                  ],
                ),
                kWidth5,
                VerticalDivider(
                  color: greyColor,
                  thickness: 1,
                ),
                kWidth5,
                Text(
                  '3.7k',
                  style: TextStyle(
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
