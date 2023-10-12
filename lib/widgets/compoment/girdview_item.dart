import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hue_nhaunao_partygame/modules/detail_game/detail_game_screen.dart';
import 'package:hue_nhaunao_partygame/widgets/image_custom.dart';
import 'package:hue_nhaunao_partygame/widgets/text_custom.dart';
import 'package:hue_nhaunao_partygame/widgets/widgets.dart';

Widget gridviewItem() {
  return AnimationLimiter(
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
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(DetailGameScreen.routeName,
                      arguments: {"index": index});
                },
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Material(
                          child: Hero(
                            tag: 'detail_game_$index',
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: imageNetwork(
                                    url: 'https://i.imgur.com/efGHYDc.png',
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: BlurryContainer(
                            padding: EdgeInsets.zero,
                            child: CircleAvatar(
                              backgroundColor: Colors.white.withOpacity(0.5),
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
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textTitleMedium('Vòng quay nhậu',
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                                cHeight(8),
                                textBodySmall(
                                    'Ngẫu nhiên trả lời những câu hỏi, được thì tha mà ba la thì uống!.',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
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
          ),
        );
      },
      padding: const EdgeInsets.only(top: 12, bottom: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: (1.5 / 2),
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
      ),
    ),
  );
}
