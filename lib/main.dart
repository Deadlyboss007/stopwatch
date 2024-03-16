import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late Stopwatch stopwatch;
  late Timer timer;
  int value = 0; // Initialize value to 0
  double fare = 20; // Initialize fare to 20
  final databaseReference = FirebaseDatabase.instance.ref().child('VALUE/INT');
  late StreamSubscription<DatabaseEvent> valueListener;

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();

    // Start a timer to update the UI
    timer = Timer.periodic(const Duration(milliseconds: 30), (_) {
      if (mounted) {
        setState(() {
          updateFare(); // Update fare every 30 milliseconds
        });
      }
    });

    // Listen to changes in the Firebase database
    valueListener = databaseReference.onValue.listen((DatabaseEvent) {
      final dynamic data = DatabaseEvent.snapshot.value;
      if (data != null && data is int) {
        setState(() {
          value = data;
          // Start or stop stopwatch based on value
          if (value == 1) {
            stopwatch.start();
          } else if (value == 0) {
            stopwatch.stop();
          }
        });
      } else {
        print('Invalid or missing data from Firebase');
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    valueListener.cancel();
    super.dispose();
  }

  void updateFare() {
    // Calculate fare based on elapsed time
    double elapsedSeconds = stopwatch.elapsedMilliseconds / 1000;
    double elapsedMinutes = elapsedSeconds / 60; // Get full minutes
    double remainingSeconds = elapsedSeconds % 60; // Get remaining seconds

    // Fare calculation logic
    if (elapsedMinutes < 1) {
      fare = 20; // ₹20 for the first minute
    } else {
      int fullMinutes = elapsedMinutes.toInt(); // Full minutes elapsed

      // Calculate fare for full minutes
      fare = fullMinutes * 20;

      // Calculate fare for remaining seconds
      if (remainingSeconds >= 30) {
        fare += 10; // ₹10 for every 30 seconds
      }
    }

    // Change text color to red after 1 minute and 30 seconds
    if (elapsedMinutes >= 1) {
      setState(() {
        // Update text color to red
        textColor = Colors.red;
      });
    }
  }

  String returnFormattedText() {
    // Format elapsed time and fare
    var milli = stopwatch.elapsedMilliseconds;
    String milliseconds = (milli % 1000).toString().padLeft(3, "0");
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0");

    return "$minutes:$seconds:$milliseconds \n Fare: ₹${fare.toStringAsFixed(2)}";
  }

  Color textColor = const Color.fromARGB(255, 63, 187, 69); // Text color

  @override
  Widget build(BuildContext context) {
    double buttonHeight = 450.0; // Set button height to 450px

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: buttonHeight,
            width: buttonHeight,
            alignment: Alignment.center,
            color: Colors.black, // Keep background color black
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  returnFormattedText(),
                  style: TextStyle(
                    color: textColor, // Set text color
                    fontSize: 30,
                    fontFamily: "Digital",
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ), // Add some space between time and fare text
              ],
            ),
          ),
        ),
      ),
    );
  }
}
