import 'package:fake_store_app/constant/colors.dart';
import 'package:flutter/material.dart';

class ScreenProduct extends StatelessWidget {
  const ScreenProduct({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
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
          childAspectRatio: 1 / 2,
        ),
        itemBuilder: (context, index) {
          return SizedBox(
            width: width * 0.5,
          );
        },
      ),
    );
  }
}
