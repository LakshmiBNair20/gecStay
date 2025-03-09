import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gecw_lakx/presentation/auth/sign_in_screen.dart';
import 'package:gecw_lakx/presentation/chat/chat_room_screen.dart';
import 'package:gecw_lakx/presentation/hostel_process/create_hostel_screen.dart';
import 'package:gecw_lakx/presentation/owner_home/owner_home_screen.dart';

import '../../deleted/owner_profile/owner_profile_screen.dart';

class BottomNavigationBarOwnerWidget extends StatefulWidget {
  final String? userId;
  const BottomNavigationBarOwnerWidget({super.key, this.userId});

  @override
  BottomNavigationBarOwnerWidgetState createState() =>
      BottomNavigationBarOwnerWidgetState();
}

class BottomNavigationBarOwnerWidgetState extends State<BottomNavigationBarOwnerWidget> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    OwnerHomeScreen(), // Replace with your home screen
    
    CreateHostelScreen(),
    ChatRoomScreen(userId: '',),
    OwnerProfileScreen(),
  ];

  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFF006E); // Bright Pink
    const secondaryColor = Color(0xFFB0B0B0); // Light Gray
    const backgroundColor = Color(0xFF1F1F1F); // Dark Gray
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomAppBar(
        color: backgroundColor,
        elevation: 0,
        child: Stack(
          children: [
            // Custom paint background
            SizedBox(
              width: double.infinity,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return CustomPaint(
                    size: Size(constraints.maxWidth, constraints.maxHeight),
                    painter: BottomNavCurvePainter(
                        backgroundColor: Colors.grey[900]!),
                  );
                },
              ),
            ),
            
            SizedBox(
              height: 56,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NavBarIcon(
                    text: "Home",
                    icon: Icons.home,
                    defaultColor: secondaryColor,
                    selectedColor: primaryColor,
                    selected: _selectedIndex == 0,
                    onPressed: () => _onNavBarItemTapped(0),
                  ),
               
                  
                   NavBarIcon(
                    text: "Add Hostel",
                    icon: Icons.add,
                    defaultColor: secondaryColor,
                    selectedColor: primaryColor,
                    selected: _selectedIndex == 1,
                    onPressed: () => _onNavBarItemTapped(1),
                  ),
                  
                   NavBarIcon(
                    text: "chat",
                    icon: Icons.chat,
                    defaultColor: secondaryColor,
                    selectedColor: primaryColor,
                    selected: _selectedIndex == 2,
                    onPressed: () => _onNavBarItemTapped(2),
                  ),
                  
                   NavBarIcon(
                  text: "Log Out",
                  icon: Icons.logout,
                  defaultColor: secondaryColor,
                selected: _selectedIndex == 3,
                selectedColor: primaryColor,
                  onPressed: () async {
                    bool confirmSignOut = await showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text("Confirm Sign Out"),
                        content:
                            const Text("Are you sure you want to log out?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(false), // No
                            child: const Text("No"),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(true), // Yes
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
                 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 

class BottomNavCurvePainter extends CustomPainter {
  BottomNavCurvePainter({
    this.backgroundColor = Colors.black,
    this.insetRadius = 40,
  });

  final Color backgroundColor;
  final double insetRadius;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    Path path = Path()..moveTo(0, 12);

    double insetCurveBeginningX = size.width / 2 - insetRadius;
    double insetCurveEndX = size.width / 2 + insetRadius;
    double transitionToInsetCurveWidth = size.width * .05;

    path.quadraticBezierTo(size.width * 0.20, 0,
        insetCurveBeginningX - transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(
        insetCurveBeginningX, 0, insetCurveBeginningX, insetRadius / 2);

    path.arcToPoint(
      Offset(insetCurveEndX, insetRadius / 2),
      radius: Radius.circular(insetRadius / 2),
      clockwise: false,
    );

    path.quadraticBezierTo(
        insetCurveEndX, 0, insetCurveEndX + transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 12);
    path.lineTo(size.width, size.height + 56);
    path.lineTo(0, size.height + 56);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon({
    super.key,
    required this.text,
    required this.icon,
    required this.selected,
    required this.onPressed,
    this.selectedColor = const Color(0xFFFF006E),
    this.defaultColor = Colors.black54,
  });

  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: CircleAvatar(
        backgroundColor: selected ? Colors.white : Colors.transparent,
        child: Icon(
          icon,
          size: 25,
          color: selected ? Colors.black : defaultColor,
        ),
      ),
    );
  }
}
