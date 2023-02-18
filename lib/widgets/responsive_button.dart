import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';

import 'app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({this.width = 120, this.isResponsive = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: AppColors.mainColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? Container(
                    margin: const EdgeInsets.only(left: 20, right: 50),
                    child: AppText(
                      text: 'Book Trip Now',
                      color: Colors.white,
                    ),
                  )
                : SizedBox(),
            Icon(
              Icons.arrow_forward_ios,
              size: 10,
              color: Colors.white,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: Colors.white,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 19,
              color: Colors.white,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 24,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
