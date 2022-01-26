import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/theme_selector.dart';
import 'package:portfolio_website/utils/view_wrapper.dart';
import 'package:portfolio_website/widgets/bullet_list.dart';
import 'package:portfolio_website/widgets/navigation_arrow.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> with SingleTickerProviderStateMixin {
  late double screenWidth;
  late double screenHeight;

  String bulletList1 = 'Integrated Diploma - B.Tech from Nelson Mandela University with successful projects and award.';
  String bulletList2 = 'Ability to execute all the stages project cycle.';
  String bulletList3 = 'Ability to design and develop the business process flow as per the client requirements.';
  String bulletList4 = 'Hard-working, sincere and quick grasping aptitude.';
  String bulletList5 = 'Efficient time-management skills and team player with strong communication skills and inter-personal skills.';
  String bulletList6 =
      'I am well familiar with C#, PHP, Visual Basic, ASP.NET, JavaScript and HTML '
      'and the basics of Java, flutter (dart) and Python. '
      'I am well familiar with MySQL, MSSQL, Oracle, PL/SQL and '
      'the basics of MangoDB and Firebase.';

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return ViewWrapper(
      desktopView: desktopView(),
      mobileView: mobileView(),
    );
  }

  Widget desktopView() {
    return Stack(
      children: [
        NavigationArrow(isBackArrow: false),
        NavigationArrow(isBackArrow: true),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 1),
            Expanded(flex: 3, child: infoSection()),
            Spacer(flex: 1),
            Expanded(
                flex: 3,
                child: BulletList(
                  strings: [bulletList1, bulletList2, bulletList3, bulletList4, bulletList5, bulletList6],
                )),
            Spacer(flex: 1),
          ],
        )
      ],
    );
  }

  Widget mobileView() {
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.05),
        infoText(),
        SizedBox(height: screenHeight * 0.05),
        Container(
          height: screenHeight * 0.3,
          child: BulletList(
            strings: [bulletList1, bulletList2, bulletList3, bulletList4, bulletList5, bulletList6],
          ),
        ),
      ],
    );
  }

  Widget infoSection() {
    return Container(
      width: screenWidth * 0.35,
      child: Column(
        children: [
          profilePicture(),
          SizedBox(height: screenHeight * 0.05),
          infoText()
        ],
      ),
    );
  }

  Widget profilePicture() {
    return Container(
      height: getImageSize(),
      width: getImageSize(),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(getImageSize() / 2),
          child: Image.asset(
            'assets/picture1.png',
            fit: BoxFit.cover,
          )),
    );
  }

  double getImageSize() {
    if (screenWidth > 1600 && screenHeight > 800) {
      return 350;
    } else if (screenWidth > 1300 && screenHeight > 600) {
      return 300;
    } else if (screenWidth > 1000 && screenHeight > 400) {
      return 200;
    } else {
      return 150;
    }
  }

  Widget infoText() {
    return Text(
      'My name is Frank Boateng, an enthusiastic, highly-motivated person'
      'who likes to take initiative and seek out new challenges. '
      'I am very dedicated and hardworking software engineer / developer '
      'with proven leadership and organizational skills seeking to apply my abilities '
      'to any company that I will work for. '
      'Also, to gain much knowledge as I can and enhance my programming skills '
      'with the available and new technologies. ',
      overflow: TextOverflow.clip,
      style: ThemeSelector.selectBodyText(context),
    );
  }
}
