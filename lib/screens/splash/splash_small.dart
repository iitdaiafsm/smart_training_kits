import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_training_kits/helper/shared_files.dart';
import 'package:smart_training_kits/screens/login/main.dart';
import 'package:smart_training_kits/widgets/button.dart';

import '../../helper/styles.dart';
import 'splash_controller.dart';

class SplashSmall extends StatelessWidget {
  final SplashController controller;

  const SplashSmall({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context),
      height: height(context),
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: AppMethods.DEFAULT_PADDING),
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "asset/image/app_logo.png",
            width: width(context) / 3.125,
            fit: BoxFit.contain,
          ),
          Text(
            "SKILLRATE",
            style: textStyleLogo(context: context, fontSize: FontSize.LOGO),
          ),
          SizedBox(
            height: AppMethods.DEFAULT_PADDING * 2,
          ),
          AppButton(
            onTap: () {
              Get.to(() => LoginScreen());
            },
            text: "Login",
            isLoading: false,
          ),
          SizedBox(
            height: AppMethods.DEFAULT_PADDING,
          ),
          AppButton(
            onTap: () {},
            text: "Register",
            buttonStyle: ButtonThemeStyle.Bordered,
          ),
          SizedBox(
            height: AppMethods.DEFAULT_PADDING,
          ),
          Text(
            "Continue as a guest",
            style: textStyle(
              context: context,
              color: Theme.of(context).primaryColor,
              isBold: true,
              haveUnderline: true,
            ),
          ),
          SizedBox(
            height: AppMethods.DEFAULT_PADDING,
          ),
        ],
      ),
    );
  }
}
