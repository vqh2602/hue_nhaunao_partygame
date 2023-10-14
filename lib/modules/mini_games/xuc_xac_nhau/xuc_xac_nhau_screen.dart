import 'dart:async';
import 'dart:math';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutx_ui/flutx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hue_nhaunao_partygame/modules/mini_games/xuc_xac_nhau/xuc_xac_nhau_controller.dart';
import 'package:hue_nhaunao_partygame/widgets/base/base.dart';
import 'package:hue_nhaunao_partygame/widgets/compoment/alert_confetti.dart';
import 'package:hue_nhaunao_partygame/widgets/loading_custom.dart';
import 'package:hue_nhaunao_partygame/widgets/text_custom.dart';
import 'package:just_audio/just_audio.dart';

/// hero tag: 'detail_game_$index'
/// [index]: hiêuh ứng hero tag
class XucXacNhauScreen extends StatefulWidget {
  const XucXacNhauScreen({Key? key}) : super(key: key);
  static const String routeName = '/xuc_xac_nhau';

  @override
  State<XucXacNhauScreen> createState() => _XucXacNhauScreenState();
}

class _XucXacNhauScreenState extends State<XucXacNhauScreen> {
  XucXacNhauController xucxacnhauController = Get.put(XucXacNhauController());
  var arguments = Get.arguments;
  Random random = Random();
  int currentImageIndex = 0;
  int counter = 1;
  bool isRoll = false;
  bool isShowConfetti = false;

  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // xucxacnhauController.checkLogin();
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
    return xucxacnhauController.obx(
        (state) => Stack(
              children: [
                Container(
                    width: Get.width,
                    height: Get.height,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/background/1.jpg'),
                            fit: BoxFit.cover)),
                    padding: EdgeInsets.zero,
                    child: Center(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Transform.rotate(
                          angle: isRoll ? random.nextDouble() * 180 : 0,
                          child: Container(
                            decoration: BoxDecoration(
                                // border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(35),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ]),
                            child: Image.asset(
                              xucxacnhauController
                                  .listDataMiniGame[currentImageIndex].image,
                              height: Get.width * 0.7,
                            ),
                          ),
                        ),
                        const SizedBox(height: 80),
                        AbsorbPointer(
                          absorbing: !isRoll ? false : true,
                          child: FxButton.medium(
                            backgroundColor: Colors.green,
                            onPressed: () async {
                              // Rolling the dice

                              // Sound
                              try {
                                await player
                                    .setAsset('assets/audios/rolling-dice.mp3');
                                player.play();
                              } on Exception catch (_) {}

                              // Roll the dice
                              Timer.periodic(const Duration(milliseconds: 70),
                                  (timer) {
                                counter++;
                                setState(() {
                                  currentImageIndex = random.nextInt(8);
                                  isRoll = true;
                                });

                                if (counter >= 25) {
                                  timer.cancel();
                                  setState(() {
                                    counter = 1;
                                    isRoll = false;
                                  });
                                  Future.delayed(
                                      const Duration(milliseconds: 500), () {
                                    setState(() {
                                      isShowConfetti = true;
                                      dialogConfetti(
                                          backgroundColor:
                                              Colors.purple.shade700,
                                          images: xucxacnhauController
                                              .listDataMiniGame[
                                                  currentImageIndex]
                                              .image,
                                          textColor: Colors.white,
                                          isShowConfetti: isShowConfetti,
                                          title: xucxacnhauController
                                              .listDataMiniGame[
                                                  currentImageIndex]
                                              .title,
                                          description: xucxacnhauController
                                              .listDataMiniGame[
                                                  currentImageIndex]
                                              .description,
                                          onPressed: () {
                                            setState(() {
                                              isShowConfetti = false;
                                            });
                                            Get.back();
                                          });
                                    });
                                  });
                                }
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: textDisplayMedium('Xúc xắc',
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ))),
                SafeArea(
                  child: Row(children: [
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
                  ]),
                ),
              ],
            ),
        onLoading: const LoadingCustom());
  }
}
