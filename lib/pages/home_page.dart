import 'package:flutter/material.dart';
import 'package:my_first_app/widgets/light_button.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/top_bar.dart';
import '../widgets/dark_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        // Do nothing, already on the home page
        break;
      case 1:
        // Navigate to the settings page
        Navigator.pushReplacementNamed(context, '#');
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
                  padding: const EdgeInsets.only(bottom: 44.0),
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(49, 27, 107, 1),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 44.0),
                  child: Text(
                    '10:10:28',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          clipBehavior:
                              Clip.none, // add this line to remove clipping
                          children: [
                            LightButton(
                              text: 'BedTime\n 10:20 PM',
                              onPressed: () {},
                              width: 195,
                              height: 60,
                            ),
                            Positioned(
                              top: -20,
                              right: 0,
                              left: 0,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(49, 27, 107, 1),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/phone.png'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Stack(
                          clipBehavior:
                              Clip.none, // add this line to remove clipping
                          children: [
                            LightButton(
                              text: 'BedTime\n 10:20 PM',
                              onPressed: () {},
                              width: 195,
                              height: 60,
                            ),
                            Positioned(
                              top: -20,
                              right: 0,
                              left: 0,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(49, 27, 107, 1),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/phone.png'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: DarkButton(
                        text: 'START SLEEP TRACKING',
                        onPressed: () {},
                        width: 400,
                        height: 60)),
                Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: DarkButton(
                        text: 'SET ALARM',
                        onPressed: () {},
                        width: 400,
                        height: 40))
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
