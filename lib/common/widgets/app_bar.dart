import 'package:flutter/material.dart';
import 'package:ulearning_flutter_riverpod/common/widgets/text_widgets.dart';

import '../utils/app_colors.dart';
/*
  preferredSize widget gives you a height or space from the appbar downwords and we can
  put child in the given space

 */

AppBar buildAppbar({String title=""}) {
  return AppBar(

    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        height: 1,
      ),
    ),
    title: Text16Normal(text: title, color: AppColors.primaryText),
  );
}
