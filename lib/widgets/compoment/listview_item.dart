import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:hue_nhaunao_partygame/data/data_local/data_game.dart';
import 'package:hue_nhaunao_partygame/data/models/game.dart';
import 'package:hue_nhaunao_partygame/modules/detail_game/detail_game_screen.dart';
import 'package:hue_nhaunao_partygame/widgets/image_custom.dart';
import 'package:hue_nhaunao_partygame/widgets/text_custom.dart';
import 'package:hue_nhaunao_partygame/widgets/widgets.dart';

Widget listviewItem() {
  List<Game> listGameHot = [];
  listGameHot =
      listDataGame.where((element) => element.tag.contains('noi_bat')).toList();
  return AnimationLimiter(
    child: ListView.builder(
      itemCount: listGameHot.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 375),
          child: SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(DetailGameScreen.routeName, arguments: {
                    "index": index / 2,
                    "data": listGameHot[index]
                  });
                },
                child: Container(
                    height: Get.width * 0.3,
                    width: Get.width * 0.2,
                    margin: const EdgeInsets.only(right: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: Get.width * 0.2,
                          width: Get.width * 0.2,
                          child: Material(
                            child: Hero(
                              tag: 'detail_game_${index / 2}',
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: imageNetwork(
                                    url: listGameHot[index].image,
                                  )),
                            ),
                          ),
                        ),
                        cHeight(4),
                        textBodySmall(listGameHot[index].title,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ],
                    )),
              ),
            ),
          ),
        );
      },
    ),
  );
}
