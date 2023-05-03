import 'package:flutter/material.dart';
import 'package:my_first_app/widgets/light_button.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/top_bar.dart';
import '../widgets/swipe_up_button.dart';
import '../widgets/current_datetime_v2.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class StartSleepingPage extends StatefulWidget {
  const StartSleepingPage({super.key});

  @override
  _StartSleepingPageState createState() {
    return _StartSleepingPageState();
  }
}

class _StartSleepingPageState extends State<StartSleepingPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        break;
      case 1:
        // Navigate to the settings page
        Navigator.pushReplacementNamed(context, 'clock_view');
        break;
      case 2:
        // Navigate to the notifications page
        Navigator.pushReplacementNamed(context, '#');
        break;
      default:
        // Do nothing
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sleeping app',
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: TopBar(
          title: 'My Screen',
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
          onOptionsPressed: () {
            // Do something when options button is pressed
          },
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background-2.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(35, 56, 99, 0.6), BlendMode.darken)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 22.0),
                  child: Text(
                    'Good Night',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 39.0),
                  child: CurrentDateTimeWidgetV2(),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 69.0),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 3.0,
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/icon-1.png',
                          width: 250,
                          height: 250,
                        ),
                      ),

                      //icon
                    )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 46.0),
                  // child: LightButton(
                  //     text: 'START SLEEPING',
                  //     onPressed: () {},
                  //     width: 380,
                  //     height: 60)
                  child: SwipeableButtonView(
                      onFinish: () {},
                      onWaitingProcess: () {},
                      activeColor: Color(0xFF009C41),
                      buttonWidget: Container(
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.grey,
                        ),
                      ),
                      buttonText: 'Swipe'),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

Widget _buildFirstComponent() {
  return LightButton(
      text: 'START SLEEPING', onPressed: () {}, width: 380, height: 60);
}
