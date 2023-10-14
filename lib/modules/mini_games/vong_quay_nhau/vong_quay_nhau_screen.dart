import 'dart:async';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutx_ui/flutx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hue_nhaunao_partygame/modules/mini_games/vong_quay_nhau/vong_quay_nhau_controller.dart';
import 'package:hue_nhaunao_partygame/widgets/base/base.dart';
import 'package:hue_nhaunao_partygame/widgets/compoment/alert_confetti.dart';
import 'package:hue_nhaunao_partygame/widgets/loading_custom.dart';
import 'package:hue_nhaunao_partygame/widgets/text_custom.dart';
import 'package:just_audio/just_audio.dart';

class VongQuayNhauScreen extends StatefulWidget {
  const VongQuayNhauScreen({Key? key}) : super(key: key);
  static const String routeName = '/vong_quay_nhau';

  @override
  State<VongQuayNhauScreen> createState() => _VongQuayNhauScreenState();
}

class _VongQuayNhauScreenState extends State<VongQuayNhauScreen> {
  VongQuayNhauController vongquaynhauController =
      Get.put(VongQuayNhauController());
  var arguments = Get.arguments;
  StreamController<int> controller = StreamController<int>();
  bool isShowConfetti = false;
  int selected = 0;
  bool isRoll = false;
  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();

    // vongquaynhauController.checkLogin();
  }

  @override
  void dispose() {
    controller.close();
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
    return vongquaynhauController.obx(
        (state) => Stack(
              children: [
                Container(
                    width: Get.width,
                    height: Get.height,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/background/2.jpg'),
                            fit: BoxFit.cover)),
                    padding: EdgeInsets.zero,
                    child: Center(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: Get.width * 0.8,
                          height: Get.width * 0.8,
                          child: FortuneWheel(
                            selected: controller.stream,
                            items: [
                              for (int i = 0;
                                  i <
                                      vongquaynhauController
                                          .listDataMiniGame.length;
                                  i++)
                                FortuneItem(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                            vongquaynhauController
                                                .listDataMiniGame[i].image,
                                          ),
                                          radius: 20,
                                        ),
                                      ),
                                    ),
                                    style: FortuneItemStyle(
                                        color: i % 2 == 0
                                            ? Colors.deepPurple.shade500
                                            : Colors.yellow.shade700,
                                        borderWidth: 0.1))
                            ],
                            animateFirst: false,
                            onAnimationEnd: () {
                              setState(() {
                                isRoll = false;
                                isShowConfetti = true;
                              });
                              dialogConfetti(
                                  isShowConfetti: isShowConfetti,
                                  backgroundColor: Colors.yellow.shade600,
                                  boxShadowColor: Colors.yellow.shade100,
                                  images:  vongquaynhauController
                                      .listDataMiniGame[selected].image,
                                  title: vongquaynhauController
                                      .listDataMiniGame[selected].title,
                                  textColor: Colors.deepPurple.shade600,
                                  buttonColor: Colors.lightGreenAccent.shade700,
                                  description: vongquaynhauController
                                      .listDataMiniGame[selected].description,
                                  onPressed: () {
                                    setState(() {
                                      isShowConfetti = false;
                                    });
                                    Get.back();
                                  });
                            },
                            onAnimationStart: () {
                              setState(() {
                                isRoll = true;
                              });
                            },
                            styleStrategy: FortuneWheel.kDefaultStyleStrategy,
                            indicators: const <FortuneIndicator>[
                              FortuneIndicator(
                                alignment: Alignment.topCenter,
                                child: TriangleIndicator(
                                  color: Colors.yellow,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 80),
                        AbsorbPointer(
                          absorbing: !isRoll ? false : true,
                          child: FxButton.medium(
                            backgroundColor: Colors.red,
                            onPressed: () async {
                              // Rolling the dice

                              // Sound
                              try {
                                await player.setAsset('assets/audios/spin.mp3');
                                player.play();
                              } on Exception catch (_) {}

                              setState(() {
                                controller.add(
                                  selected = Fortune.randomInt(
                                      0,
                                      vongquaynhauController
                                          .listDataMiniGame.length),
                                );
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: textDisplayMedium(
                                'Quay',
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
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
