import 'package:flutter/material.dart';
import 'package:call_safe/widgets/callLog.dart';

class LogsPage extends StatefulWidget {
  const LogsPage({super.key});


  @override
  State<LogsPage> createState() => _LogsPageState();
}

class _LogsPageState extends State<LogsPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Calls"),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: const [
            CallLog(),
            CallLog(),
            CallLog(),
            CallLog(),
            CallLog(),
            CallLog(),
            CallLog(),
            CallLog(),
            CallLog(),
          ]
        ),
      ),
    );
  }
}