import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothPage extends StatefulWidget {
  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Start scanning
                  flutterBlue.startScan(timeout: Duration(seconds: 4));
                  flutterBlue.scanResults.listen((results) {
                    // do something with scan results
                    for (ScanResult r in results) {
                      print('${r.device.name} found! rssi: ${r.rssi}');
                    }
                  });
                },
                child: Text("Start Scanning"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    flutterBlue.stopScan();
    super.dispose();
  }
}
