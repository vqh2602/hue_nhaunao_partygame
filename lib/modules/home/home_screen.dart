import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hue_nhaunao_partygame/c_theme/c_theme.dart';
import 'package:hue_nhaunao_partygame/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hue_nhaunao_partygame/widgets/base/base.dart';
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
                      height: Get.width * 0.3,
                      child: AnimationLimiter(
                        child: ListView.builder(
                          itemCount: 4,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: Container(
                                      height: Get.width * 0.3,
                                      width: Get.width * 0.2,
                                      margin: const EdgeInsets.only(right: 20),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: Get.width * 0.2,
                                            width: Get.width * 0.2,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: imageNetwork(
                                                    url:
                                                        'https://i.imgur.com/QeV0eaj.png')),
                                          ),
                                          cHeight(4),
                                          textBodySmall('Vòng quay nhậu',
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis),
                                        ],
                                      )),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
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
                        color: Colors.transparent,
                        child: AnimationLimiter(
                          child: GridView.builder(
                            itemCount: 10,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 500),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      color: Colors.transparent,
                                      child: Stack(
                                        children: [
                                          SizedBox(
                                            height: double.infinity,
                                            width: double.infinity,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: imageNetwork(
                                                    url:
                                                        'https://i.imgur.com/efGHYDc.png',
                                                    fit: BoxFit.cover)),
                                          ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: BlurryContainer(
                                                padding: EdgeInsets.zero,
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white
                                                      .withOpacity(0.5),
                                                  radius: 20,
                                                  child: const Icon(
                                                    FontAwesomeIcons.solidHeart,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    textTitleMedium(
                                                        'Vòng quay nhậu',
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: Colors.white),
                                                        cHeight(8),
                                                    textBodySmall(
                                                        'Ngẫu nhiên trả lời những câu hỏi, được thì tha mà ba la thì uống!.',
                                                        maxLines: 3,
                                                        overflow:  TextOverflow.ellipsis,
                                                        color: Colors.white),
                                                        cHeight(8),
                                                  ],
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            padding: const EdgeInsets.only(top: 12,bottom: 20),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: (1.5 / 2),
                              crossAxisCount: 2,
                              crossAxisSpacing: 14,
                              mainAxisSpacing: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
