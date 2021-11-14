// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Using "static" so that we can easily access it later
  static final ValueNotifier<ThemeMode> themeNotifier =
  ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            // Remove the debug banner
            debugShowCheckedModeBanner: false,
            title: 'Kindacode.com',
            theme: ThemeData(primarySwatch: Colors.amber),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: HomeScreen(),
          );
        });
  }
}

// Home Screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kindacode.com'),
        actions: [
          IconButton(
              icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode),
              onPressed: () {
                MyApp.themeNotifier.value =
                MyApp.themeNotifier.value == ThemeMode.light
                    ? ThemeMode.dark
                    : ThemeMode.light;
              })
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to Other Screen'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OtherScreen()));
          },
        ),
      ),
    );
  }
}

// Other Screen
class OtherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Screen'),
      ),
      body: Center(
        child: Text(
          'Hello',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
