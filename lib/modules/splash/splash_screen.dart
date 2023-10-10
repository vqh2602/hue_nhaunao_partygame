import 'package:hue_nhaunao_partygame/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hue_nhaunao_partygame/widgets/base/base.dart';
import 'package:flutx_ui/flutx.dart';
import 'package:hue_nhaunao_partygame/widgets/loading_custom.dart';
import 'package:hue_nhaunao_partygame/widgets/text_custom.dart';
import 'package:hue_nhaunao_partygame/widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController splashController = Get.put(SplashController());

  @override
  void initState() {
    super.initState();
    // splashController.checkLogin();
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
    return splashController.obx((state) => Stack(
          children: <Widget>[
            SizedBox(
              width: Get.width,
              height: Get.height,
              child: Image.asset(
                'assets/background/splash.png',
                fit: BoxFit.cover,
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Container(
                  width: Get.width,
                  height: Get.height,
                  alignment: Alignment.bottomLeft,
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textHeadlineLarge('Huệ - Nhậu thôi',
                          color: Colors.white, fontWeight: FontWeight.w900),
                      cHeight(12),
                      textBodyMedium(
                          'Nhậu hết mình, nhậu quên mình,\nnhậu thôi!',
                          color: Colors.white),
                      cHeight(50),
                      Align(
                        alignment: Alignment.center,
                        child: FxButton.large(
                            onPressed: () {
                              splashController.checkLogin();
                            },
                            borderRadiusAll: 100,
                            child: textLableLarge('Triển thôi !',
                                color: Colors.white,
                                fontWeight: FontWeight.w900)),
                      )
                    ],
                  ),
                )),
          ],
        ),onLoading: const LoadingCustom());
  }
}
