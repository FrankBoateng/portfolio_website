import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/project_model.dart';
import 'package:portfolio_website/utils/theme_selector.dart';
import 'package:portfolio_website/utils/view_wrapper.dart';
import 'package:portfolio_website/widgets/navigation_arrow.dart';
import 'package:portfolio_website/widgets/project_entry.dart';
import 'package:portfolio_website/widgets/project_image.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({Key? key}) : super(key: key);

  @override
  _ProjectsViewState createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  late double screenWidth;
  late double screenHeight;
  int selectedIndex = 0;
  List<Project> projects = [
    Project(
        title: 'Fleetsync',
        imageURL: 'fleetsync.PNG',
        description:
            'Created a website and mobile application (App) for the transport industry to promote safety. '
            'The focus was on Taxi industry for the taxi owners to get reports on the behaviour and '
                'attitude their drivers shown to passengers on the road.'
                'Passengers can also click a panic button on the App to send SMS to their Next of Kins, '
                'with the details of the taxi and driver as well as the current '
                'location of the taxi or the passenger when their life is in danger. '

                'https://www.fleetsync.co.za/'),
    Project(
        title: 'Mr Errand',
        imageURL: 'errand.png',
        description: 'Ecommerce App for monthly and daily transactions. '
            'It help users to save money and time by queuing at various shopping centers. '
            'Users can make changes to their selections and delete the selected products submitted before the deadline date. '
            'Order can be place between 1st and 20th of every month. '
            'Mr. Errand provide the following under Monthly specials. '
            'Deliveries are made on monthly basis and its free. '
            'Monthly deliveries are done per the users preferred date from a list of dates. '
            'Users get email for their order summary containing order details. '
            'https://play.google.com/store/apps/details?id=za.co.profeciait.errandboy&gl=ZA'),

    Project(
        title: 'Hitman',
        imageURL: 'hitman.jpg',
        description:
        'Website and App for selling supplements '

            'https://hitmanweb.com/'),



    // Project(
    //     title: 'Active Mode Website',
    //     imageURL: 'project3.jpg',
    //     description:
    //     'Advert website'),
    //
    // Project(
    //     title: 'Mr Errand App and Dashboard (Ecommerce System)',
    //     imageURL: 'project3.jpg',
    //     description:
    //     'Sell products online,'),
  ];


  @override
  void didChangeDependencies() {
    precacheImage(AssetImage('fleetsync.PNG'), context);
    precacheImage(AssetImage('errand.png'), context);
    precacheImage(AssetImage('hitman.jpg'), context);

    super.didChangeDependencies();
  }

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
    double space = MediaQuery.of(context).size.height * 0.03;
    List<Widget> images =
    List.generate((projects.length * 1.5).ceil(), (index) {
      if (index.isEven) {
        return ProjectImage(
            project: projects[index ~/ 2],
            onPressed: () => updateIndex(index ~/ 2));
      } else {
        return SizedBox(height: space);
      }
    });
    return Stack(
      children: [
        NavigationArrow(isBackArrow: true),
        Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.05, horizontal: screenWidth * 0.1),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: images,
                ),
                SizedBox(width: space),

                Container(
                  height: screenHeight * 0.2 * 2 + space * 2,
                  child: Stack(
                    children: [
                      AnimatedAlign(
                        alignment: selectedIndex == 0
                            ? Alignment.topCenter
                            : selectedIndex == 1
                            ? Alignment.center
                            : Alignment.bottomCenter,
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.fastOutSlowIn,
                        child: Container(
                          color: Colors.white,
                          width: screenWidth * 0.05,
                          height: 3,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: space),
                Expanded(child: ProjectEntry(project: projects[selectedIndex]))
              ],
            ))
      ],
    );
  }

  Widget mobileView() {
    List<Widget> projectList = List.generate(projects.length, (index) {
      return Column(
        children: [
          Text(
            projects[index].title,
            style: ThemeSelector.selectSubHeadline(context),
          ),
          SizedBox(height: screenHeight * 0.01),
          Container(
            height: screenHeight * 0.1,
            width: screenWidth,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                projects[index].imageURL,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            projects[index].description,
            style: ThemeSelector.selectBodyText(context),
          ),
          SizedBox(height: screenHeight * 0.1),
        ],
      );
    });
    return Column(children: projectList);
  }

  void updateIndex(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }
}
