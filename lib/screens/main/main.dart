import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/responsive_widget.dart';
import 'controller.dart';
import 'small.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (controller) {
        return ResponsiveWidget(
            smallScreen: Small(
          controller: controller,
        ));
      },
    );
  }
}
