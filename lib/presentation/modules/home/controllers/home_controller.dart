import 'package:author_hub/models/generic_data_model.dart';
import 'package:author_hub/providers/library_api.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Book> books = RxList<Book>.empty();
  RxBool loading = true.obs;

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();

    ever(books, (v) {
      if (books.isNotEmpty) {
        loading.value = false;
      }
    });
    books.value = await ApiProvider.instance.getBooks();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    ApiProvider.instance.dispose();
  }
}
