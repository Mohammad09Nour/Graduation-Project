import 'package:flutter_application_2/models/item_info.dart';
import 'package:get/get.dart';

class CreatePostController extends GetxController {
  ItemInfo item = ItemInfo("", [], "", "", "").obs as ItemInfo;

  String get getTitle => item.title;
  set setTitle(String val) => item.title = val;

  String get getDescrobtion => item.descriptions;
  set setDescribtion(String val) => item.title = val;

  List<String> get getImageUrls => item.imageUrl;
  set setImageUrls(List<String> val) => item.imageUrl = val;
}
