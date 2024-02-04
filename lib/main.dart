import 'package:call_safe/screens/homePage.dart';
import 'package:call_safe/screens/logsPage.dart';
import 'package:flutter/material.dart';
import 'requests.dart';
import 'package:provider/provider.dart';
import 'package:call_safe/widgets/upload.dart';
import 'package:call_safe/widgets/transcribedText.dart';
import 'package:call_safe/widgets/upload.dart';
import 'package:call_safe/widgets/transcribedText.dart';
import 'package:call_safe/widgets/scamDetected.dart';
import 'package:call_safe/widgets/noScamDetected.dart';
import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:vibration/vibration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyAppState(),
        child: MaterialApp(
          title: 'CallSafe',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Color.fromARGB(255, 33, 149, 243)),
            useMaterial3: true,
          ),
          home: MyHomePage(),
        ));
  }
}

class MyAppState extends ChangeNotifier {
  var cardsList = <Widget>[
    Upload(),
    const SizedBox(height: 20),
  ];

  int alert = 0;

  int pressed = 0;
  String apiResult = '';

  void addCard(Widget card) {
    cardsList.add(card);
    notifyListeners();
  }

  Future<void> fetchDataAndCheckScam() async {
    try {
      final pythonData = await fetchData();
      apiResult = pythonData.result;
      checkScam();
    } catch (e) {
      // Handle the exception, e.g., show an error message
      print('Error fetching data: $e');
    }
  }

  void checkScam() {

    int random = Random().nextInt(2);

    
    print(apiResult);
    if (alert == 1) {
      cardsList.removeAt(1);
    }

    if (apiResult == "True") {
      Vibration.vibrate();
      cardsList.insert(1, const ScamDetected());
    } else {
      cardsList.insert(1, const NoScamDetected());
    }

    alert = 1;

    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const HomePage(title: "CallSafe");
      case 1:
        page = const LogsPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(
              TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
          child: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            indicatorColor: Color(0xFF1976D2),
            backgroundColor: Color.fromARGB(255, 33, 149, 243),
            selectedIndex: selectedIndex,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home, color: Colors.white),
                icon: Icon(Icons.home, color: Colors.white),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.phone, color: Colors.white),
                label: 'Logs',
              ),
            ],
          ),
        ),
        body: Row(
          children: [
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}
