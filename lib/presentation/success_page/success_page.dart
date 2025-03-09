import 'package:flutter/material.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  _SuccessPageState createState() =>
      _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  bool _animationCompleted = false;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  // Simulate checking animation
  void _startAnimation() async {
    await Future.delayed(Duration(seconds: 2)); // Wait for animation to complete
    setState(() {
      _animationCompleted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Checking animation
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: _animationCompleted
                  ? Icon(Icons.check_circle, color: Colors.green, size: 100)
                  : CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
            ),
            SizedBox(height: 20),

            // Success text
            Text(
              _animationCompleted
                  ? "Hostel Added Successfully!"
                  : "Adding Hostel...",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            
            // Button to go back or do something after success
            // ElevatedButton(
            //   onPressed: () {
            //     // Navigate to another screen or take action
            //     Navigator.pop(context);  // Example of popping back
            //   },
            //   child: Text("OK"),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.green,
            //     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            //     shape: StadiumBorder(),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
