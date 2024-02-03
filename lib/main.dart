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


void main() async {
  print("We out here");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("MADE IT HERE\n\n\n\n\n\n\n\n\n");
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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      )
    );
  }
}

class MyAppState extends ChangeNotifier {
  var cardsList = <Widget>[
    Upload(),
    const SizedBox(height: 30),
    TranscribedText(),
  ];

  int alert = 0;

  void addCard(Widget card) {
    cardsList.add(card);
    notifyListeners();
  }

  void checkScam() {
    int random = Random().nextInt(2);

    if(alert == 1) {
      cardsList.removeAt(cardsList.length - 1);
    }

    if (random == 0) {
      cardsList.add(const ScamDetected());
    } 
    else {
      cardsList.add(const NoScamDetected());
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
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          indicatorColor: Theme.of(context).colorScheme.secondary,
          backgroundColor: Theme.of(context).colorScheme.background,
          selectedIndex: selectedIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.phone),
              label: 'Logs',
            ),
          ],
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