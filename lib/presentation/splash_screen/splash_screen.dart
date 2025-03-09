import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gecw_lakx/application/hostel_process/common_hostel_process/common_hostel_process_bloc.dart';
import 'package:gecw_lakx/main.dart';
import 'package:gecw_lakx/presentation/auth/sign_in_screen.dart';
import 'package:gecw_lakx/presentation/bottom_navigation/bottom_navigation_owner.dart';
import 'package:gecw_lakx/presentation/bottom_navigation/bottom_navigation_student.dart';
import 'package:gecw_lakx/presentation/hostel_details/hostel_details_student_app_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_links/app_links.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  String? role;
  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _linkSubscription;
  Uri? _deepLinkUri;
  bool _showWelcomeMessage = true;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeAnimation =
        CurvedAnimation(parent: _fadeController, curve: Curves.easeIn);
    _fadeController.forward().then((_) {
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _showWelcomeMessage = false;
        });
        _checkLoginStatus();
      });
    });
    _initDeepLinks();
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();
    _fadeController.dispose();
    super.dispose();
  }

  void _initDeepLinks() async {
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      setState(() {
        _deepLinkUri = uri;
      });
      _handleDeepLink(uri);
    });
    final initialUri = await _appLinks.getInitialLink();
    if (initialUri != null) {
      setState(() {
        _deepLinkUri = initialUri;
      });
      _handleDeepLink(initialUri);
    }
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      role = prefs.getString('role');
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        if (role == 'Student') {
          if (_deepLinkUri != null) {
            _handleDeepLinkForStudent(user.uid);
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const BottomNavigationBarStudentWidget()),
            );
          }
        } else if (role == 'Hostel_Owner') {
          context.read<CommonHostelProcessBloc>().add(
                CommonHostelProcessEvent.getOwnersHostelList(userId: user.uid),
              );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    BottomNavigationBarOwnerWidget(userId: user.uid)),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (ctx) => SignInScreen()),
          );
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (ctx) => SignInScreen()),
        );
      }
    } catch (e) {
      _showError("An error occurred: $e");
    }
  }

  void _handleDeepLinkForStudent(String userId) async {
    final hostelId = _deepLinkUri?.queryParameters['hostelId'];
    if (hostelId != null) {
      final hostelResp = await fetchHostelDetails(hostelId);
      if (hostelResp != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HostelDetailsStudentAppScreen(
              userId: userId,
              hostelResp: hostelResp,
            ),
          ),
        );
      } else {
        _showError("Hostel details not found.");
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNavigationBarStudentWidget(),
        ),
      );
    }
  }

  void _handleDeepLink(Uri uri) {
    final hostelId = uri.queryParameters['hostelId'];
    if (hostelId != null) {
      fetchHostelDetails(hostelId).then((hostelResp) {
        if (hostelResp != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HostelDetailsStudentAppScreen(
                userId: FirebaseAuth.instance.currentUser?.uid ?? '',
                hostelResp: hostelResp,
              ),
            ),
          );
        }
      }).catchError((error) {
        _showError("Error fetching hostel details: $error");
      });
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error", style: TextStyle(color: Colors.white)),
          content: Text(message, style: TextStyle(color: Colors.white)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK", style: TextStyle(color: Colors.purple)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/home.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: _showWelcomeMessage
                ? FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      "Welcome to GECStay",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                : const CircularProgressIndicator(color: Colors.purple),
          ),
        ],
      ),
    );
  }
}