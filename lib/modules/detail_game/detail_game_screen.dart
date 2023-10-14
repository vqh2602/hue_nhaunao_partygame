import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hue_nhaunao_partygame/data/models/game.dart';
import 'package:hue_nhaunao_partygame/modules/detail_game/detail_game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hue_nhaunao_partygame/widgets/base/base.dart';
import 'package:flutx_ui/flutx.dart';
import 'package:hue_nhaunao_partygame/widgets/image_custom.dart';
import 'package:hue_nhaunao_partygame/widgets/loading_custom.dart';
import 'package:hue_nhaunao_partygame/widgets/text_custom.dart';
import 'package:hue_nhaunao_partygame/widgets/widgets.dart';

/// hero tag: 'detail_game_$index'
/// [index]: hiêuh ứng hero tag
/// [data]: du lieu cua game
class DetailGameScreen extends StatefulWidget {
  const DetailGameScreen({Key? key}) : super(key: key);
  static const String routeName = '/detail_game';

  @override
  State<DetailGameScreen> createState() => _DetailGameScreenState();
}

class _DetailGameScreenState extends State<DetailGameScreen> {
  DetailGameController detailgameController = Get.put(DetailGameController());
  var arguments = Get.arguments;
  late Game game;
  @override
  void initState() {
    super.initState();
    setState(() {
      game = Get.arguments['data'];
    });
    // detailgameController.checkLogin();
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
    return detailgameController.obx(
        (state) => Stack(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height,
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: <Widget>[
                      Material(
                        child: Hero(
                          tag: 'detail_game_${arguments?['index']}',
                          child: SizedBox(
                            width: Get.width,
                            height: Get.height * 0.6,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30)),
                              child: imageNetwork(
                                url: game.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        width: Get.width,
                        height: Get.height,
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 30, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textHeadlineLarge(game.title,
                                fontWeight: FontWeight.w900),
                            cHeight(12),
                            textBodyMedium(game.description,
                                maxLines: 7,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.grey),
                            cHeight(50),
                          ],
                        ),
                      )),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: FxButton.large(
                            onPressed: () {
                              // detailgameController.checkLogin();

                              game.onTap();
                            },
                            borderRadiusAll: 100,
                            child: textLableLarge('Triển thôi !',
                                color: Colors.white,
                                fontWeight: FontWeight.w900)),
                      ),
                      cHeight(16)
                    ],
                  ),
                ),
                SafeArea(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const BlurryContainer(
                              color: Colors.white24,
                              child: Icon(
                                FontAwesomeIcons.solidCaretLeft,
                                color: Colors.white,
                              ),
                            )),
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const BlurryContainer(
                              color: Colors.white24,
                              child: Icon(
                                FontAwesomeIcons.solidHeart,
                                color: Colors.red,
                              ),
                            )),
                      ]),
                )
              ],
            ),
        onLoading: const LoadingCustom());
  }
}
