
import 'package:hue_nhaunao_partygame/c_theme/c_theme.dart';
import 'package:hue_nhaunao_partygame/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hue_nhaunao_partygame/widgets/base/base.dart';
import 'package:hue_nhaunao_partygame/widgets/compoment/girdview_item.dart';
import 'package:hue_nhaunao_partygame/widgets/compoment/listview_item.dart';
import 'package:hue_nhaunao_partygame/widgets/image_custom.dart';
import 'package:hue_nhaunao_partygame/widgets/search.dart';
import 'package:hue_nhaunao_partygame/widgets/text_custom.dart';
import 'package:hue_nhaunao_partygame/widgets/widgets.dart';
import 'package:sticky_headers/sticky_headers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    // homeController.checkLogin();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildBody(
      backgroundColor: Colors.white,
      context: context,
      body: _buildBody(),
      appBar: null,
    );
  }

  Widget _buildBody() {
    return homeController.obx((state) => SafeArea(
          child: Padding(
            padding: alignment_20_0(),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    cHeight(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textDisplayMedium('Let\'s Discover',
                            color: Colors.black, fontWeight: FontWeight.w900),
                        CircleAvatar(
                          radius: 24,
                          child: imageNetwork(
                              url: 'https://i.imgur.com/i8bTOL9.png'),
                        ),
                      ],
                    ),
                    cHeight(20),
                    searchCustom(),
                    cHeight(20),
                    textTitleLarge('Nổi bật 🔥',
                        color: Colors.black, fontWeight: FontWeight.w900),
                    cHeight(20),
                    SizedBox(
                        width: Get.width,
                        height: Get.width * 0.32,
                        child: listviewItem()),
                    cHeight(20),
                    StickyHeader(
                      header: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.only(top: 8, bottom: 12),
                        child: Container(
                            // height: 50.0,
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: bgGray,
                                borderRadius: BorderRadius.circular(100)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 8.0),
                            // alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 12),
                                  decoration: BoxDecoration(
                                    // color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: textTitleMedium('Tất cả',
                                        color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: textTitleMedium('Hết mình',
                                        fontWeight: FontWeight.w900,
                                        color: a500),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 12),
                                  decoration: BoxDecoration(
                                    // color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: textTitleMedium('Yêu thích',
                                        color: Colors.grey),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      content: Container(
                          color: Colors.transparent, child: gridviewItem()),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
