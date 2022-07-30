// ignore_for_file: must_be_immutable

import 'dart:html';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/create_post_controller.dart';
import 'package:flutter_application_2/controller/home_page_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import '../widgets/categories_dropdown.dart';

class CreatePost extends StatelessWidget {
  List<Uint8List>? imageFileList = List.filled(3, Uint8List(0));

  Future<Uint8List?> selectImages(int index) async {
    final selectedImages = await ImagePickerWeb.getImageAsBytes();

    if (selectedImages != null) {
      return imageFileList![index] = selectedImages;
    }
    return selectedImages;
  }

  // ignore: deprecated_member_use
  final List<Widget> attachedImages = new List.filled(3, Icon(Icons.add));
  final cont = Get.put(CreatePostController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/background.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.3)),
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 1.2,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: Text(
                        "WE ARE THANKFUL FOR YOUR HELP",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              GetX<CreatePostController>(builder: (controller) {
                            return TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[800]),
                                hintText: "Title",
                                fillColor: Colors.white70,
                              ),
                              onChanged: (String txt) {
                               controller.
                              },
                            );
                          }),
                        ),
                      ),
                      //  Expanded(child: CategoriesDropDown()),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      maxLines: 6,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        filled: true,
                        hintText: "Describe your donation",
                        fillColor: Colors.white70,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.6,
                    color: Colors.white70.withOpacity(0.4),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Attch photos (max 3)",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            getAttachImage(0),
                            getAttachImage(1),
                          ],
                        ),
                        Center(
                          child: getAttachImage(2),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 15, right: MediaQuery.of(context).size.width / 10),
                  child: Container(
                    width: 140,
                    height: 30,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 193, 63, 245),
                        Color.fromARGB(255, 143, 26, 221)
                      ]),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "SHARE",
                        style: TextStyle(fontSize: 14),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getAttachImage(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Container(
        color: Colors.white70,
        width: MediaQuery.of(context).size.width / 3,
        height: 125,
        child: GestureDetector(
          onTap: () async {
            selectImages(index).then((value) {
              if (imageFileList![index].length != Uint8List(0).length) {
                attachedImages[index] = Image.memory(
                  imageFileList![index],
                );
                setState(() {});
              }
            });
          },
          child: attachedImages[index],
        ),
      ),
    );
  }
}
