import 'package:flutter_application_2/models/item_info.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var items = [].obs;
  var selectedPageIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  void fetchItems() async {
    await Future.delayed(Duration(seconds: 20));

    List<ItemInfo> tmp = [];

    tmp.add(ItemInfo("title1", ["images/pp.jpg"], "phoneNumber", "descriptions",
        "images/pp.jpg"));

    tmp.add(ItemInfo("title2", ["images/nat.jpg"], "phoneNumber",
        "descriptions", "images/pp.jpg"));

    tmp.add(ItemInfo("title3", ["images/nat2.jpg"], "phoneNumber",
        "descriptions", "images/pp.jpg"));

    tmp.add(ItemInfo("title4", ["images/nat2.jpg"], "phoneNumber",
        "descriptions", "images/pp.jpg"));

    items.value = tmp;
  }

  addItem(ItemInfo item) async {
    await Future.delayed(Duration(seconds: 5));
    items.add(item);
  }

  int get getSelectedPage => selectedPageIndex.value;
  void setSelectedPage(int index) {
    selectedPageIndex.value = index;
  }
}
