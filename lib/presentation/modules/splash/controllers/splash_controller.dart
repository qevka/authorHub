import 'package:author_hub/presentation/routes/app_pages.dart';
import 'package:author_hub/providers/library_api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print("loading");
    ApiProvider(http.Client(), () {
      Get.offAndToNamed(Routes.home);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
