import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gecw_lakx/application/room_details_owner/room_details_bloc.dart';

class UpdateVacancyScreen extends StatefulWidget {
  final String hostelId;
  const UpdateVacancyScreen({super.key, required this.hostelId});

  @override
  State<UpdateVacancyScreen> createState() => _UpdateVacancyScreenState();
}

class _UpdateVacancyScreenState extends State<UpdateVacancyScreen> {
  List<Map<String, dynamic>> _rooms = [];
  final List<TextEditingController> _vacancyControllers = [];
  final List<TextEditingController> _totalBedsControllers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark mode background
      appBar: AppBar(
        title: const Text('Update Vacancy'),
        backgroundColor: Colors.grey[900],
        elevation: 0,
      ),
      body: BlocConsumer<RoomDetailsBloc, RoomDetailsState>(
        listener: (context, state) {
          state.fetchSuccessOrFailureOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Failed to load rooms')),
                );
              },
              (rooms) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Rooms loaded successfully')),
                );
                setState(() {
                  _rooms = List<Map<String, dynamic>>.from(rooms);
                  _vacancyControllers.clear();
                  _totalBedsControllers.clear();
                  _totalBedsControllers.addAll(_rooms.map((room) =>
                      TextEditingController(text: room['beds'].toString())));
                  _vacancyControllers.addAll(_rooms.map((room) =>
                      TextEditingController(text: room['vacancy'].toString())));
                });
              },
            ),
          );
        },
        builder: (context, state) {
          if (state.isSubmitting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_rooms.isEmpty) {
            return const Center(
              child: Text(
                'No data available',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _rooms.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.grey[850],
                      margin: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Room Number: ${_rooms[index]['roomNumber']}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            _buildEditableField(
                                "Total Beds", _totalBedsControllers[index]),
                            const SizedBox(height: 10),
                            _buildEditableField(
                                "Vacancy", _vacancyControllers[index]),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  
                  for (int i = 0; i < _rooms.length; i++) {
                    // print("button pressed ${_totalBedsControllers[i]} , ${_vacancyControllers[i]}");
                    context.read<RoomDetailsBloc>().add(
                          RoomDetailsEvent.updateRoomDetailsByOwner(
                            hostelId: widget.hostelId,
                            roomNumber: _rooms[i]['roomNumber'],
                            updatedVacancy:
                                int.tryParse(_vacancyControllers[i].text) ??
                                    _rooms[i]['vacancy'],
                            totalBeds:
                                _totalBedsControllers[i].text 
                          ),
                        );
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          );
        },
      ),
    );
  }

  /// Editable TextField for Vacancy
  Widget _buildEditableField(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[800],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
