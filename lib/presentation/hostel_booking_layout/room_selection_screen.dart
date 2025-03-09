import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gecw_lakx/application/room_details_owner/room_details_bloc.dart';
import 'package:gecw_lakx/domain/hostel_process/hostel_resp_model.dart';
import 'package:gecw_lakx/presentation/bottom_navigation/bottom_navigation_student.dart';
import 'package:gecw_lakx/presentation/student_home/student_home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoomSelectionScreen extends StatefulWidget {
  final HostelResponseModel hostelResp;
  final List<Map<String, dynamic>> rooms;

  const RoomSelectionScreen(
      {super.key, required this.rooms, required this.hostelResp});

  @override
  _RoomSelectionScreenState createState() => _RoomSelectionScreenState();
}

class _RoomSelectionScreenState extends State<RoomSelectionScreen> {
  late List<Map<String, dynamic>> rooms;

  @override
  void initState() {
    super.initState();
    // Ensure a deep copy of the room data to avoid modifying the original list
    rooms = widget.rooms.map((room) {
      return {
        ...room, // Copy existing room data
        'selectedBeds': List.generate(
            room['beds'], (index) => false), // Initialize selection list
      };
    }).toList();
  }

  void toggleBedSelection(int roomIndex, int bedIndex) {
    setState(() {
      if (bedIndex < rooms[roomIndex]['vacancy']) {
        rooms[roomIndex]['selectedBeds'][bedIndex] =
            !rooms[roomIndex]['selectedBeds'][bedIndex];
      }
    });
  }

  void confirmSelection() {
    List<Map<String, dynamic>> selectedRooms = [];

    for (var room in rooms) {
      int selectedCount =
          room['selectedBeds'].where((selected) => selected == true).length;
      if (selectedCount > 0) {
        selectedRooms.add({
          'roomNumber': room['roomNumber'],
          'selectedBedsCount': selectedCount,
        });
      }
    }

    if (selectedRooms.isNotEmpty) {
      _showConfirmationDialog(
          hostelResp: widget.hostelResp, selectedRooms: selectedRooms);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one bed')),
      );
    }
  }

  void _showConfirmationDialog({
    required List<Map<String, dynamic>> selectedRooms,
    required HostelResponseModel hostelResp,
  }) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text(
            "Confirm Booking",
            style: TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                style: const TextStyle(color: Colors.white), // White text
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.grey[800], // Dark field background
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  labelStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.grey[800],
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your phone number";
                  }
                  final RegExp phoneRegex =
                      RegExp(r'^[0-9]{10}$'); // 10-digit number validation
                  if (!phoneRegex.hasMatch(value)) {
                    return "Enter a valid 10-digit phone number";
                  }
                  return null; // Valid input
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                final String? userId = prefs.getString('owner_userid');

                if (nameController.text.isEmpty ||
                    phoneController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in all fields')),
                  );
                  return;
                }

                if (userId != null) {
                  context.read<RoomDetailsBloc>().add(
                      RoomDetailsEvent.bookNowButtonPressed(
                          userId: userId,
                          hostelName: hostelResp.hostelName,
                          hostelOwnerUserId: hostelResp.hostelOwnerUserId,
                          hostelId: hostelResp.hostelId,
                          selectedRooms: selectedRooms,
                          userName: nameController.text,
                          userPhone: phoneController.text));
                }

                Navigator.of(context).pop(); // Close dialog
              },
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Select Beds"),
        backgroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: rooms.length,
              itemBuilder: (context, roomIndex) {
                return Card(
                  color: Colors.grey[850],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Room: ${rooms[roomIndex]['roomNumber']}",
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 10,
                          children: List.generate(rooms[roomIndex]['beds'],
                              (bedIndex) {
                            bool isAvailable =
                                bedIndex < rooms[roomIndex]['vacancy'];
                            return GestureDetector(
                              onTap: isAvailable
                                  ? () =>
                                      toggleBedSelection(roomIndex, bedIndex)
                                  : null,
                              child: Container(
                                width: 40,
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: rooms[roomIndex]['selectedBeds']
                                          [bedIndex]
                                      ? Colors.blueAccent
                                      : (isAvailable
                                          ? Colors.grey[700]
                                          : Colors.red[900]),
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                ),
                                child: Text(
                                  "${bedIndex + 1}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: BlocConsumer<RoomDetailsBloc, RoomDetailsState>(
                listener: (context, state) {
                  state.successOrFailureOption.fold(() {}, (either) {
                    either.fold((f) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("Some error Occured...Try again later")));
                    }, (s) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (ctx) =>
                              BottomNavigationBarStudentWidget()));
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text("Booking successfull")));
                    });
                  });
                },
                builder: (context, state) {
                  return state.isSubmitting
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.deepPurpleAccent,
                          ),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: confirmSelection,
                          // Implement booking functionality here

                          child: const Text(
                            "Confirm Selection",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
