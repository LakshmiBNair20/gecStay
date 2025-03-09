import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gecw_lakx/application/hostel_process/common_hostel_process/common_hostel_process_bloc.dart';
import 'package:gecw_lakx/presentation/admin_app/new_hostel_screen/new_hostel_screen.dart';
import 'package:gecw_lakx/presentation/chat/chat_room_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  String hostelApprovalType = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:             FloatingActionButton(
  onPressed: () async{
    // Add your chat navigation logic here
    final prefs = await SharedPreferences.getInstance();
      final String? userId = prefs.getString('owner_userid');
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ChatRoomScreen(userId: userId.toString(),)));
  },
  backgroundColor: Colors.deepPurpleAccent,
  foregroundColor: Colors.white,
  elevation: 4,
  child: Icon(Icons.chat, size: 28),
  
),
floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Admin Dashboard",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocConsumer<CommonHostelProcessBloc, CommonHostelProcessState>(
        listener: (context, state) {
          state.hostelGetFailureOrSuccess.fold(() {}, (either) {
            either.fold((f) {}, (s) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => NewHostelsScreen(
                        hostelList: s,
                        hostelApprovalType: hostelApprovalType,
                      )));
            });
          });
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                AdminOptionCard(
                  title: "New Hostels",
                  icon: Icons.pending_actions,
                  onTap: () {
                    // Navigate to NewHostelsScreen
                    // Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>NewHostelsScreen()));
                    setState(() {
                      hostelApprovalType = 'newHostel';
                    });
                    context.read<CommonHostelProcessBloc>().add(
                        CommonHostelProcessEvent.getAdminHostelList(
                            approvalType: 'pending'));
                  },
                ),
                const SizedBox(height: 16),
                AdminOptionCard(
                  title: "Approved Hostels",
                  icon: Icons.check_circle,
                  onTap: () {
                    // Navigate to ApprovedHostelsScreen
                    setState(() {
                      hostelApprovalType = 'approvedHostel';
                    });
                    context.read<CommonHostelProcessBloc>().add(
                        CommonHostelProcessEvent.getAdminHostelList(
                            approvalType: 'approved'));
                  },
                ),
                const SizedBox(height: 16),
                AdminOptionCard(
                  title: "Rejected Hostels",
                  icon: Icons.cancel,
                  onTap: () {
                    // Navigate to DeniedHostelsScreen
                    setState(() {
                      hostelApprovalType = 'rejectedHostel';
                    });
                    context.read<CommonHostelProcessBloc>().add(
                        CommonHostelProcessEvent.getAdminHostelList(
                            approvalType: 'rejected'));
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                AdminOptionCard(
                  title: "Deleted Hostels",
                  icon: Icons.cancel,
                  onTap: () {
                    // Navigate to ApprovedHostelsScreen
                    setState(() {
                      hostelApprovalType = 'deletedHostel';
                    });
                    context.read<CommonHostelProcessBloc>().add(
                        CommonHostelProcessEvent.getAdminHostelList(
                            approvalType: 'deleted'));
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                state.isSubmitting
                    ? CircularProgressIndicator(
                        color: Colors.purple,
                      )
                    : Center(),
   

              ],
            ),
          );
        },
      ),
    );
  }
}

class AdminOptionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const AdminOptionCard({
    super.key,
    required this.title,
    required this.icon,
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
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          child: Row(
            children: [
              Icon(icon, color: Colors.deepPurpleAccent, size: 30),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
