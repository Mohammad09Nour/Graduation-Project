import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/models/item_info.dart';
import 'package:flutter_application_2/widgets/networking_page_provider.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  final ItemInfo item;
  const DetailsPage({Key? key, required this.item}) : super(key: key);

  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late ItemInfo item;

  @override
  Widget build(BuildContext context) {
    item = widget.item;
    return Scaffold(
      body: getBody(context),
    );
  }

  getBody(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;
    double opacity = 0.15;
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverPersistentHeader(
                floating: true,
                delegate: NetworkingPageHeader(0, screenH * 0.4, item)),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  locationRow(opacity),
                  mobileRow(),
                  description(opacity),
                  descriptionText(opacity),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Container locationRow(double opacity) {
    return Container(
      color: Colors.grey.withOpacity(opacity),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton.icon(
                onPressed: () {
                  launchUrl(Uri.parse('geo://09568164'));
                },
                icon: Icon(
                  Icons.location_on_rounded,
                  color: kPrimaryColor,
                ),
                label: Text(
                  "Hama, Abi Al-fiedaa",
                  style: TextStyle(fontSize: 20, color: kPrimaryColor),
                )),
            SizedBox(width: 2),
            Text(
              "(19 min) 5,9 km",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Container descriptionText(double opacity) {
    return Container(
      color: Colors.grey.withOpacity(opacity),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 10),
        child: Text(
          item.descriptions,
          style: TextStyle(
            letterSpacing: 1.0,
            fontSize: 21,
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  Container description(double opacity) {
    return Container(
      color: Colors.grey.withOpacity(opacity),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          bottom: 10,
        ),
        child: Text(
          "Description",
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }

  Container mobileRow() {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 10),
          child: TextButton.icon(
            onPressed: () {
              launchUrl(Uri.parse('tel://${item.phoneNumber}'));
            },
            icon: Icon(
              Icons.phone,
              color: kPrimaryColor,
            ),
            label: Text(
              item.phoneNumber,
              style: TextStyle(fontSize: 20, color: kPrimaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
