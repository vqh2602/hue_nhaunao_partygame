import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hue_nhaunao_partygame/data/storage.dart';
import 'package:hue_nhaunao_partygame/modules/home/home_screen.dart';

class SplashController extends GetxController
    with GetTickerProviderStateMixin, StateMixin {
  GetStorage box = GetStorage();
  var arguments = Get.arguments;

  @override
  Future<void> onInit() async {
    super.onInit();
    changeUI();
  }

  Future<void> checkLogin() async {
    loadingUI();
    var dataUser = await box.read(Storages.dataUser);
    // kiểm tra dữ liệu user và thời gian đăng nhập
    // Future.delayed(const Duration(seconds: 5), () {
    //   Get.offAndToNamed(HomeScreen.routeName);
    // });
    if (dataUser != null && await checkLoginTimeOut()) {
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAndToNamed(HomeScreen.routeName);
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
      
          Get.offAndToNamed(HomeScreen.routeName);
        

        // Get.offAndToNamed(LoginScreen.routeName);
      });
    }
    // changeUI();
  }

  Future<bool> checkLoginTimeOut() async {
    var dataTimeOut = await box.read(Storages.dataLoginTime);
    if (dataTimeOut != null) {
      // Kiểm tra một thời điểm có nằm trong một khoảng thời gian hay không
      try {
        DateTime dateTime = DateTime.now();
        DateTime startDate = DateTime.parse(dataTimeOut);
        DateTime endDate =
            startDate.add(const Duration(hours: Config.dataLoginTimeOut));
        if (dateTime.isAfter(startDate) && dateTime.isBefore(endDate)) {
          return true;
        } else {}
      } on Exception catch (_) {
        return false;
      }
    }
    return false;
  }

  changeUI() {
    change(null, status: RxStatus.success());
  }

  updateUI() {
    update();
  }

  loadingUI() {
    change(null, status: RxStatus.loading());
  }
}
