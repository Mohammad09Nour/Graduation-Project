import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';

class ProfilePage extends StatefulWidget {
  final String url;
  const ProfilePage({Key? key, required this.url}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 35),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: kPrimaryColor,
                  ),
                )
              ],
            ),
          ),
          Hero(
            tag: widget.url,
            child: Container(
              height: 100,
              width: 100,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 28),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 25),
                ],
                borderRadius: BorderRadius.circular(45),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.url),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Sliman",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            "Syria, Aleppo",
            style:
                TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(left: 10, bottom: 10, top: 20),
            child: Text(
              "Contribution",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 6, right: 6, top: 6),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25))),
              child: GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                childAspectRatio: 5 / 6,
                children: [
                  buildCard('images/p.jpg'),
                  buildCard('images/ppp.jpg'),
                  buildCard('images/pp.jpg'),
                  buildCard('images/pp.jpg')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Card buildCard(String url) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(url),
          ),
        ),
      ),
    );
  }
}
