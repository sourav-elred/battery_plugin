import 'package:flutter/material.dart';
import 'package:battery_plugin/battery_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int _batteryLevel = -1;

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
  }

  Future<void> _getBatteryLevel() async {
    int batteryLevel;
    try {
      batteryLevel = await BatteryPlugin.getBatteryLevel();
    } catch (e) {
      batteryLevel = -1;
    }

    if (!mounted) return;

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Battery Plugin Example'),
        ),
        body: Center(
          child: Text('Battery level: $_batteryLevel%'),
        ),
      ),
    );
  }
}
