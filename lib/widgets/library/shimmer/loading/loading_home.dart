import 'package:flutter/material.dart';
import 'package:hue_nhaunao_partygame/widgets/library/shimmer/shimmer.dart';

class LoadingHome extends StatelessWidget {
  const LoadingHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // ProfilePageShimmer(),
                VideoShimmer(),
                // VideoShimmer(isRectBox: false, hasBottomBox: true,),
                ListTileShimmer(),
                ListTileShimmer(),
                ListTileShimmer(),
                ListTileShimmer(),
                ListTileShimmer(),
              ],
            ),
          )),
    );
  }
}
