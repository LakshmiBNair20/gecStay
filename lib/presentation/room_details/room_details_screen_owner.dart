import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gecw_lakx/application/room_details_owner/room_details_bloc.dart';
import 'package:gecw_lakx/presentation/bottom_navigation/bottom_navigation_owner.dart';

class RoomDetailsScreen extends StatefulWidget {
  final String hostelId;
  const RoomDetailsScreen({super.key, required this.hostelId});

  @override
  // ignore: library_private_types_in_public_api
  _RoomDetailsScreenState createState() => _RoomDetailsScreenState();
}

class _RoomDetailsScreenState extends State<RoomDetailsScreen> {
  final TextEditingController _roomCountController = TextEditingController();
  List<Map<String, dynamic>> rooms = [];

  void loadRooms() {
    int roomCount = int.tryParse(_roomCountController.text) ?? 0;
    if (roomCount > 0) {
      setState(() {
        rooms = List.generate(roomCount, (index) {
          return {
            'roomNumber': TextEditingController(),
            'beds': TextEditingController(),
            'vacancy': TextEditingController(),
          };
        });
      });
    }
  }

void submitData({required String hostelId}) {
  Map<String, dynamic> roomData = {
    'hostelId': hostelId,
    'rooms': rooms.map((room) => {
      'roomNumber': room['roomNumber'].text,
      'beds': room['beds'].text,
      'vacancy': room['vacancy'].text,
    }).toList(),
  };

  debugPrint("Final Room Data: $roomData");

  context.read<RoomDetailsBloc>().add(
    RoomDetailsEvent.addRoomsToFirestore(rooms: roomData, hostelId: hostelId),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Enter Room Details"),
        backgroundColor: Colors.grey[900],
      ),
      body: BlocConsumer<RoomDetailsBloc, RoomDetailsState>(
        listener: (context, state) {
          state.successOrFailureOption.fold((){}, (either){
            either.fold((f){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Some error occured..Try again later')));
            }, (s){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>BottomNavigationBarOwnerWidget()));
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Layout added successfully')));
            });
          });
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _roomCountController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Number of Rooms",
                    labelStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: loadRooms,
                    child: const Text("Load",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: rooms.isEmpty
                      ? const Center(
                          child: Text(
                            "Enter number of rooms and press Load",
                            style: TextStyle(color: Colors.white70),
                          ),
                        )
                      : ListView.builder(
                          itemCount: rooms.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.grey[850],
                              margin: const EdgeInsets.only(bottom: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Room ${index + 1}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    const SizedBox(height: 8),
                                    _buildTextField("Room Number",
                                        rooms[index]['roomNumber']),
                                    const SizedBox(height: 8),
                                    _buildTextField(
                                        "Total Beds", rooms[index]['beds']),
                                    const SizedBox(height: 8),
                                    _buildTextField(
                                        "Vacancy", rooms[index]['vacancy']),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
                if (rooms.isNotEmpty)
                  SizedBox(
                    width: double.infinity,



                    child: 
                    
                    state.isSubmitting?Center(child: CircularProgressIndicator(color: Colors.deepPurpleAccent,),):
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent[700],
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () => submitData(hostelId: widget.hostelId),
                      child: const Text("Submit",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.grey[700],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
