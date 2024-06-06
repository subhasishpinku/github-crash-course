import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_flutter_riverpod/features/welcome/provider/welcome_notifier.dart';
import 'package:ulearning_flutter_riverpod/features/welcome/view/widgets/widgets.dart';

import '../../../common/utils/image_res.dart';



//final indexProvider = StateProvider<int>((ref)=>0);

class Welcome extends ConsumerWidget {
  Welcome({Key? key}) : super(key: key);

  final PageController _controller = PageController();
 // int dotsIndex=0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

   // print('my dots value is $dotsIndex');
    final index = ref.watch(indexDotProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: EdgeInsets.only(top: 30.h),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                //showing our three welcome pages
                PageView(
                  onPageChanged: (value){
                   // dotsIndex=value;
                    ref.read(indexDotProvider.notifier).changeIndex(value);
                  },
                  controller: _controller,
                  //scrollBehavior: AxisDirection.up,
                  scrollDirection: Axis.horizontal,
                  children: [
                    //first page
                    AppOnboardingPage(controller: _controller,
                        imagePath: ImageRes.reading,
                        title: "First See Learning",
                        subTitle:
                            "Forget about the paper, now learning all in one place",
                        index: 1, context:context),
                    //second page
                    AppOnboardingPage(controller:_controller,
                        imagePath: ImageRes.man,
                        title: "Connect With Everyone",
                        subTitle:
                            "Always keep in touch with your tutor and friends. Let's get connected",
                        index: 2, context:context),
                    AppOnboardingPage(controller:_controller,
                        imagePath: ImageRes.boy,
                        title: "Always Fascinated Learning",
                        subTitle:
                            "Anywhere, anytime. The time is at your discretion. So study wherever you can",
                        index: 3, context:context)
                  ],
                ),
                //for showing dots
                Positioned(
                  bottom: 50,
                  child: DotsIndicator(
                    position: index.toDouble(),
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(24.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.w)
                      )
                    ),
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
