

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

class QuizzCard extends StatelessWidget {
  const QuizzCard(
      {super.key, required this.cardTitle, required this.cardDescription,required this.onClockFuction});

  final String cardTitle;
  final String cardDescription;
  final Function() onClockFuction;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:  EdgeInsets.only(
            left: 10.w, top: 10.h), // set padding to move button to top left corner
        child: ElevatedButton(
          onPressed: onClockFuction,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color(0xFF0F8A74)), // set background color
            minimumSize: MaterialStateProperty.all<Size>(
                const Size(190, 250)), // set minimum size
            // You can also use fixedSize property to set the exact button size
          ),
          child: Container(
            height: 240.h,
            width: 160.w,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    children: [
                      WidgetSpan(
                      child: SizedBox(
                        width: 160.w,
                        height: 20.h,
                    ),
                  ),
                      TextSpan(
                        text: cardTitle,
                        style: TextStyle(
                          fontSize: 18, // Set the font size for the title
                          fontWeight: FontWeight.bold,
                        ),
                      )]
                  ),

                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: SizedBox(
                          width: 160.w,
                          height: 40.h,
                        ),
                      ),
                      TextSpan(
                        text: '\n$cardDescription',
                        style: TextStyle(
                          fontSize: 14, // Set the font size for the description
                        ),
                      )]


                  ),
                ],
              ),
            ),
          )

        ));
  }
}
