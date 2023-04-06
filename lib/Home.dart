import 'package:demo/utility.dart';
import 'package:demo/widgets/EventWidget.dart';
import 'package:demo/widgets/ProgressContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

Color textMainColor = HexColor("#2D2A43");

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(),
      body: getBody(),
      bottomNavigationBar: bottomBar(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 20),
            getTitle("Your progress"),
            SizedBox(
              height: 250,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ProgressContainer(
                          percentText: '19/40',
                          title: 'Working Hours',
                          dec: 'Working hours exceeded by 3 hours',
                          bgColor: Colors.red.shade300,
                          bodyColor: Colors.white,
                          percent: 33 / 40,
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ProgressContainer(
                          percentText: '82%',
                          title: 'Your Efficiency',
                          dec: 'Excellent result',
                          bgColor: Colors.amber.shade300,
                          bodyColor: HexColor("#7B5204"),
                          percent: 33 / 40,
                        ),
                      );
                    }
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 20);
                  },
                  itemCount: 5),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getTitle("Wednesday, March 7"),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.event,
                      color: textMainColor,
                      size: 28,
                    ),
                  )
                ],
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return EventWidget(
                      title: 'Meeting with front-end developers',
                      des: 'Flose Real Estate Project',
                      time: '10:00 AM',
                      timeDes: '9:50 AM - 10:50 AM',
                      bgColor: Colors.pink.shade50,
                      textColor: HexColor("#7F3F4E"),
                      avatarList: const [
                        "assets/avatar1.jpg",
                        "assets/avatar2.jpg",
                        "assets/avatar3.jpg",
                        "assets/avatar4.jpg",
                      ],
                    );
                  } else {
                    return EventWidget(
                      title: 'Internal marketing session',
                      des: 'Marketing Department',
                      time: '11:00 AM',
                      timeDes: '11:00 AM - 12:000 AM',
                      bgColor: Colors.indigo.shade50,
                      textColor: HexColor("#3A346D"),
                      avatarList: const [
                        "assets/avatar1.jpg",
                        "assets/avatar2.jpg",
                        "assets/avatar3.jpg",
                        "assets/avatar4.jpg",
                        "assets/avatar1.jpg",
                        "assets/avatar2.jpg",
                        "assets/avatar3.jpg",
                        "assets/avatar4.jpg",
                        "assets/avatar4.jpg",
                      ],
                    );
                  }
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 20);
                },
                itemCount: 4),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget getTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        title,
        style: TextStyle(
          color: textMainColor,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    );
  }

  PreferredSizeWidget getAppBar() {
    Color backGroundColor = Colors.white;
    return AppBar(
      toolbarHeight: 60,
      backgroundColor: backGroundColor,
      elevation: 0,
      title: Text(
        "Hello, Villie!",
        style: TextStyle(
          color: textMainColor,
          fontSize: 33,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: <Widget>[
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey.shade300,
              width: 3.0,
            ),
          ),
          child: const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/avatar.jpg'),
          ),
        ),
        const SizedBox(width: 25)
      ],
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  Widget bottomBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      // padding: EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.red, // HexColor("#2D2C4E"),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: HexColor("#2D2C4E"),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.blueGrey.shade300,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.view_quilt),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_box_outline_blank),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "",
            ),
          ],
          currentIndex: 0,
          onTap: (index) {},
        ),
      ),
    );
  }
}
