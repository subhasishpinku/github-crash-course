import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_flutter_riverpod/common/utils/constants.dart';
import 'package:ulearning_flutter_riverpod/common/widgets/app_shadow.dart';
import 'package:ulearning_flutter_riverpod/features/sign_in/view/sign_in.dart';

import '../../../../common/widgets/text_widgets.dart';
import '../../../../global.dart';

class AppOnboardingPage extends StatelessWidget {
  final PageController controller;
  final String imagePath;
  final String title;
  final String subTitle;
  final int index;
  final BuildContext context;

  const AppOnboardingPage(
      {Key? key,
      required this.controller,
      required this.imagePath,
      required this.title,
      required this.subTitle,
      required this.index,
      required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.fitWidth,
        ),
        Container(
            margin: EdgeInsets.only(top: 15.h),
            child: text24Normal(text: title)),
        Container(
          margin: EdgeInsets.only(top: 15.h),
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text16Normal(text: subTitle),
        ),
        _nextButton(index, controller, context)
      ],
    );
  }
}


Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      } else {
        //remember if we are first time or not
        Global.storageService
            .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY, true);

        Navigator.pushNamed(
          context,
          "/sign_in",
        );
      }
    },
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
      decoration: appBoxShadow(),
      child: Center(
          child: Text16Normal(
              text: index < 3 ? "next" : "Get started", color: Colors.white)),
    ),
  );
}
