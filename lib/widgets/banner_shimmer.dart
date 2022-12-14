import 'package:flutter/material.dart';
import 'package:smart_training_kits/helper/shared_files.dart';
import 'package:smart_training_kits/helper/styles.dart';

import 'shimmer.dart';

class BannerShimmer extends StatelessWidget {
  const BannerShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.grey,
      child: AspectRatio(
        aspectRatio: AppMethods.BannerAspectRatio,
        child: Container(
          width: width(context),
          color: Colors.white,
        ),
      ),
    );
  }
}
