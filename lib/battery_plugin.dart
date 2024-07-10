import 'dart:async';
import 'package:flutter/services.dart';

class BatteryPlugin {
  static const MethodChannel _channel = MethodChannel('battery_plugin');

  static Future<int> getBatteryLevel() async {
    final int batteryLevel = await _channel.invokeMethod('getBatteryLevel');
    return batteryLevel;
  }
}
