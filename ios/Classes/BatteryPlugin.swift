import Flutter
import UIKit

public class SwiftBatteryPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "battery_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftBatteryPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "getBatteryLevel" {
      result(getBatteryLevel())
    } else {
      result(FlutterMethodNotImplemented)
    }
  }

  private func getBatteryLevel() -> Int {
    UIDevice.current.isBatteryMonitoringEnabled = true
    if UIDevice.current.batteryState == UIDevice.BatteryState.unknown {
      return -1
    } else {
      return Int(UIDevice.current.batteryLevel * 100)
    }
  }
}
