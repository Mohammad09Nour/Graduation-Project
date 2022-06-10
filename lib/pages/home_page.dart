import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/models/item_info.dart';
import 'package:flutter_application_2/pages/details_page.dart';
import 'package:flutter_application_2/pages/profil_page.dart';
import 'package:flutter_application_2/widgets/MySearchDelegate.dart';
import 'package:readmore/readmore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _currentIndex;
  late int _selectedIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = _selectedIndex = 0;
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GGG"),
        backgroundColor: Colors.pink,
        actions: [
          IconButton(
              color: Colors.blue,
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegate());
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: [
            getBody(),
            Container(
              height: 275,
              color: Colors.black,
            )
          ]),
      bottomNavigationBar: BottomNavyBar(
        onItemSelected: (index) {
          print(index);
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(microseconds: 250),
              curve: Curves.ease,
            );
          });
        },
        selectedIndex: _selectedIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        items: [
          BottomNavyBarItem(
            activeColor: Colors.red,
            textAlign: TextAlign.center,
            icon: Icon(Icons.home_filled),
            title: Text("Home"),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.home_filled),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
            title: Text("Home"),
          )
        ],
      ),
    );
  }

  Widget getBody() {
    ItemInfo item = ItemInfo(
        "Title",
        "images/p.jpg",
        "+96395681679",
        " world this timehello world this world this timehello world this world thiworld this timehello world this world this timehello world this world thiworld this timehello world this world this timehello world this world thiworld this world this timehello world this world this timehello world this world thiworld this timehello world this world this timehello world this world thiworld this timehello world this world this timehello world this world thiworld this world this timehello world this world this timehello world this world thiworld this timehello world this world this timehello world this world thiworld this timehello world this world this timehello world this world thiworld this world this timehello world this world this timehello world this world thiworld this timehello world this world this timehello world this world thiworld this timehello world this world this timehello world this world thiworld this timehello world this world this timehello world this world this timehello world this world this timehello world this timehello world this timehello world this time",
        'images/pic.jpg');
    return Container(
      padding: EdgeInsets.all(6),
      child: ListView.builder(
        padding: EdgeInsets.only(top: 8),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return buildPostCard(context, item);
        },
      ),
    );
  }

  Widget buildPostCard(BuildContext context, ItemInfo item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProfilePage(url: item.urlProfileImage)));
                  },
                  child: Hero(
                    tag: item.urlProfileImage,
                    child: CircleAvatar(
                      radius: 17,
                      child: ClipOval(
                        child: Center(child: Image.asset(item.urlProfileImage)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 7),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Sliman",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "2/5/2022",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500]),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "(19 min) 5,9 km",
                        style: TextStyle(color: kPrimaryColor, fontSize: 15),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ReadMoreText(
                    "some description for this post and this description will be available on monday some description for this post and this description will be available on monday",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    colorClickableText: kPrimaryColor,
                    trimCollapsedText: '...Read more',
                    trimExpandedText: ' Less',
                    style: TextStyle(
                        fontSize: 17, textBaseline: TextBaseline.alphabetic),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailsPage(item: item);
                    }));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width - 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        )
                      ],
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(item.imageUrl)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
