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
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                            ),
                            LightButton(
                                text: 'BedTime',
                                onPressed: () {},
                                width: 195,
                                height: 60)
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                            ),
                            LightButton(
                                text: 'BedTime',
                                onPressed: () {},
                                width: 195,
                                height: 60)
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
