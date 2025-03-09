import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gecw_lakx/domain/hostel_process/hostel_resp_model.dart';
import 'package:gecw_lakx/presentation/hostel_details/hostel_details_admin_app_screen.dart';

class NewHostelsScreenWithLoader extends StatefulWidget {
  final String hostelApprovalType;
  final List<HostelResponseModel> hostelList;

  const NewHostelsScreenWithLoader({
    super.key,
    required this.hostelList,
    required this.hostelApprovalType,
  });

  @override
  _NewHostelsScreenWithLoaderState createState() =>
      _NewHostelsScreenWithLoaderState();
}

class _NewHostelsScreenWithLoaderState
    extends State<NewHostelsScreenWithLoader> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Show loading screen for 3 seconds
    Timer(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: isLoading
          ? _buildLoadingScreen()
          : NewHostelsScreen(
              hostelList: widget.hostelList,
              hostelApprovalType: widget.hostelApprovalType,
            ),
    );
  }

  Widget _buildLoadingScreen() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Colors.deepPurpleAccent,
          ),
          SizedBox(height: 12),
          Text(
            "Loading hostels...",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ MAIN HOSTEL SCREEN
class NewHostelsScreen extends StatelessWidget {
  final String hostelApprovalType;
  final List<HostelResponseModel> hostelList;
  NewHostelsScreen(
      {super.key, required this.hostelList, required this.hostelApprovalType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Hostels"),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: hostelList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.hotel,
                    size: 60,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "No Hostels Found",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: hostelList.length,
                itemBuilder: (context, index) {
                  final hostel = hostelList[index];
                  return HostelCard(
                    name: hostel.hostelName,
                    owner: hostel.ownerName,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HostelDetailsAdminAppScreen(
                            hostelApprovalType: hostelApprovalType,
                            hostelResp: hostel,
                            hostelId: hostel.hostelId,
                            hostelImages: hostel.hostelImages,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Replace with your chat function
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Opening chat...")),
          );
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }
}

// ✅ HOSTEL CARD UI
class HostelCard extends StatelessWidget {
  final String name;
  final String owner;
  final VoidCallback onTap;

  const HostelCard({
    super.key,
    required this.name,
    required this.owner,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        color: Colors.grey[900],
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Icon(Icons.apartment,
                  color: Colors.deepPurpleAccent, size: 32),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      owner,
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios,
                  color: Colors.white70, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
