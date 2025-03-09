import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gecw_lakx/presentation/auth/sign_in_screen.dart';
import 'package:glassmorphism/glassmorphism.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black87, Colors.black],
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 30),
              SizedBox(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    const StudentInfoCard(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Contact ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const ListTile(
                    leading: Icon(Icons.phone, color: Colors.white70),
                    title: Text(
                      "+1-987-654-3210",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.email, color: Colors.white70),
                    title: Text(
                      "student@example.com",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.home, color: Colors.white70),
                    title: Text(
                      "123 Main Street, City, State",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Academic Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const ListTile(
                    leading: Icon(Icons.school, color: Colors.white70),
                    title: Text(
                      "Department: Computer Science",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.calendar_today, color: Colors.white70),
                    title: Text(
                      "Year: Final Year",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Hostel Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, i) {
                      return HostelTile(
                        hostelName: "Room No: ${i + 101}",
                        location: "Block ${i + 1}",
                        onTap: () {},
                      );
                    },
                    separatorBuilder: (ctx, i) =>
                        const Divider(color: Colors.white24),
                    itemCount: 1,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (ctx) => SignInScreen()),
                              (route) => false);
                        },
                        icon: const Icon(Icons.logout, color: Colors.white),
                        label: const Text(
                          "Logout",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black87,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          side: BorderSide(
                              color: Colors.white
                                  .withOpacity(0.3)), // Border color
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StudentInfoCard extends StatelessWidget {
  const StudentInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: double.maxFinite,
      height: 150,
      borderRadius: 10,
      blur: 17,
      border: 0,
      alignment: Alignment.center,
      borderGradient: LinearGradient(
        colors: [Colors.white.withAlpha(25), Colors.white.withAlpha(25)],
      ),
      linearGradient: LinearGradient(
        colors: [Colors.black.withAlpha(45), Colors.black.withAlpha(65)],
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Jane Smith",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Divider(color: Colors.white70),
            SizedBox(height: 10),
            Text(
              "Computer Science Department",
              style: TextStyle(
                color: Colors.white54,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HostelTile extends StatelessWidget {
  final String hostelName;
  final String location;
  final VoidCallback onTap;

  const HostelTile({
    super.key,
    required this.hostelName,
    required this.location,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      dense: true,
      title: Text(
        hostelName,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        location,
        style: const TextStyle(
          color: Colors.white54,
          fontSize: 14,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white54),
    );
  }
}
