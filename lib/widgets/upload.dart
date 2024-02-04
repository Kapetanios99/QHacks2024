import 'package:flutter/material.dart';
import 'package:call_safe/screens/homePage.dart';
import 'package:call_safe/main.dart';
import 'package:provider/provider.dart';
import 'package:call_safe/widgets/futureFile.dart';

class Upload extends StatefulWidget {
  const Upload({
    super.key,
  });

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Card(
        color: Color.fromARGB(255, 33, 149, 243),
        child: Padding(
          padding: EdgeInsets.all(20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            const Text.rich(
              TextSpan(
                  text: "Upload an Audio File",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            IconButton(
              icon: const Icon(
                Icons.upload,
                size: 50,
                color: Colors.white,
              ),
              onPressed: () => {
                appState.pressed = 1,
                if (appState.cardsList.length < 3)
                  {
                    appState.addCard(FutureFile()),
                    appState.addCard(TextButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 33, 149, 243)), padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(10))),
                      onPressed: () => {
                        appState.addCard(FutureBuilder(
                          future: appState.fetchDataAndCheckScam(), 
                          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                            if (snapshot.hasData) {
                              return const SizedBox(height: 0);
                            }
                            else {
                              return const Text(
                                "Loading....",
                                textAlign: TextAlign.center,
                                );
                            }
                          }
                          )
                        )
                      },
                      child: const Text.rich( 
                        TextSpan(
                          text: "Check For Scam",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
                    appState.addCard(const SizedBox(height: 30)),
                  }
              },
            ),
          ]),
        ));
  }
}
