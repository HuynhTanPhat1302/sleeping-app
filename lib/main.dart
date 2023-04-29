import 'package:flutter/material.dart';
import 'package:my_first_app/widgets/dark_button.dart';
import 'widgets/light_button.dart';
import 'pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sleeping app',
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background-1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 200.0),
                  child: Image.asset(
                    'assets/images/logo-1.png',
                    width: 250,
                    height: 250,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0), // specify the vertical padding here
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceEvenly, // add this to evenly space the buttons
                    children: [
                      LightButton(
                          text: 'GET STARTED',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          },
                          width: 250,
                          height: 40),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          // child: ElevatedButton(
                          //   onPressed: () {},
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor:
                          //         const Color.fromRGBO(53, 70, 112, 1),
                          //     minimumSize: const Size(250, 40),
                          //   ),
                          //   child: const Text('ALREADY HAVE AN ACCOUNT'),
                          // ),
                          child: DarkButton(
                              text: 'ALREADY HAVE AN ACCOUNT',
                              onPressed: () {},
                              width: 250,
                              height: 40))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
