import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gecw_lakx/application/cart/cart_listing_bloc.dart';
import 'package:gecw_lakx/presentation/auth/sign_in_screen.dart';
import 'package:gecw_lakx/presentation/bottom_navigation/bottom_navigation_owner.dart';
import 'package:gecw_lakx/presentation/cart/cart_screen_student_app.dart';
import 'package:gecw_lakx/presentation/hostel_prediction/hostel_prediction_screen.dart';
import 'package:gecw_lakx/presentation/student_home/student_home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

class BottomNavigationBarStudentWidget extends StatefulWidget {
  const BottomNavigationBarStudentWidget({super.key});

  @override
  State<BottomNavigationBarStudentWidget> createState() =>
      _BottomNavigationBarStudentWidget();
}

class _BottomNavigationBarStudentWidget
    extends State<BottomNavigationBarStudentWidget> {
  final GlobalKey _filterKey = GlobalKey();
  final GlobalKey _hostelKey = GlobalKey();
  final GlobalKey _searchKey = GlobalKey();
  final GlobalKey _ratingKey = GlobalKey();

  int _selectedIndex = 0;
  late final List<Widget> _pages;

  final GlobalKey _homeKey = GlobalKey();

  final GlobalKey _predictionKey = GlobalKey();

  final GlobalKey _cartKey = GlobalKey();

  final GlobalKey _logoutKey = GlobalKey();

  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    // Initialize _pages in initState
    _pages = [
      StudentHomeScreen(
        filterKey: _filterKey,
        hostelKey: _hostelKey,
        searchKey: _searchKey,
        ratingKey: _ratingKey,
      ), // Pass GlobalKeys to StudentHomeScreen
      HostelPredictionScreen(),
      CartScreenStudentApp(),
    ];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ShowCaseWidget.of(context).startShowCase([
        _homeKey,
        _predictionKey,
        _cartKey,
        _logoutKey,
        _filterKey,
        _searchKey,
        _hostelKey,
        _ratingKey
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1F1F1F), Color(0xFF3C3C3C)], // Dark gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: SizedBox(
            height: 80, // Adjusted height for better spacing
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Showcase(
                  key: _homeKey,
                  title: 'Home',
                  description: 'This is the home screen',
                  child: NavBarIcon(
                    text: "Home",
                    icon: Icons.home,
                    defaultColor: Colors.white,
                    onPressed: () => _onNavBarItemTapped(0),
                    selected: _selectedIndex == 0,
                  ),
                ),
                Showcase(
                  key: _predictionKey,
                  title: 'Probability Checker',
                  description: 'Check the probability of getting a hostel',
                  child: NavBarIcon(
                    defaultColor: Colors.white,
                    text: "Probability checker",
                    icon: Icons.sync_problem_sharp,
                    selected: _selectedIndex == 1,
                    onPressed: () => _onNavBarItemTapped(1),
                  ),
                ),
                Showcase(
                  key: _cartKey,
                  title: 'Cart',
                  description: 'View your cart and booking history',
                  child: NavBarIcon(
                    defaultColor: Colors.white,
                    text: "Cart",
                    icon: Icons.shopping_cart,
                    selected: _selectedIndex == 2,
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      final String? userId = prefs.getString('owner_userid');
                      if (userId != null) {
                        context.read<CartListingBloc>().add(
                            CartListingEvent.loadBookingHistoryForStudent(
                                userId: userId));
                        _onNavBarItemTapped(2);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text("Some error occured..try again later")));
                      }
                    },
                  ),
                ),
                Showcase(
                  key: _logoutKey,
                  title: 'Log Out',
                  description: 'Log out from the application',
                  child: NavBarIcon(
                    text: "Log Out",
                    icon: Icons.logout,
                    defaultColor: Colors.white,
                    selected: _selectedIndex == 3,
                    onPressed: () async {
                      bool confirmSignOut = await showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("Confirm Sign Out"),
                          content:
                              const Text("Are you sure you want to log out?"),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.of(ctx).pop(false), // No
                              child: const Text("No"),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.of(ctx).pop(true), // Yes
                              child: const Text("Yes"),
                            ),
                          ],
                        ),
                      );

                      if (confirmSignOut == true) {
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (ctx) => SignInScreen()),
                          (route) => false,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
