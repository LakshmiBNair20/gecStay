import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gecw_lakx/application/approval_process/approval_process_bloc.dart';
import 'package:gecw_lakx/application/hostel_process/common_hostel_process/common_hostel_process_bloc.dart';
import 'package:gecw_lakx/domain/hostel_process/hostel_resp_model.dart';
import 'package:latlong2/latlong.dart';
import 'package:maps_launcher/maps_launcher.dart';

class HostelDetailsAdminAppScreen extends StatelessWidget {
  final String hostelApprovalType;
  final HostelResponseModel hostelResp;
  final String hostelId;
  final List<String> hostelImages;

  const HostelDetailsAdminAppScreen({
    super.key,
    required this.hostelResp,
    required this.hostelId,
    required this.hostelImages,
    required this.hostelApprovalType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          hostelResp.hostelName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: BlocConsumer<ApprovalProcessBloc, ApprovalProcessState>(
        listener: (context, state) {
          state.approvalSuccessOrFailure.fold(() {}, (either) {
            either.fold((f) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("process failed...try again later",style: TextStyle(color:Colors.red),)));
            }, (s) {
              // print("")
              
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("process successfull",style: TextStyle(color:Colors.green),)));
            });
          });
        },
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF1E1E2C), Color(0xFF121212)],
              ),
            ),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16),
              children: [
                _buildImageCarousel(),
                const SizedBox(height: 20),
                _buildMapSection(),
                const SizedBox(height: 20),
                _buildSectionTitle("Hostel Details"),
                _buildHostelDetails(),
                const SizedBox(height: 20),
                _buildSectionTitle("Hostel Owner Details"),
                _buildOwnerDetails(),
                const SizedBox(height: 30),
                state.isSubmitting
                    ? Center(child: CircularProgressIndicator())
                    : _buildActionButtons(context: context, hostel: hostelResp),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildImageCarousel() {
    return SizedBox(
      height: 220,
      child: PageView.builder(
        itemCount: hostelImages.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl: hostelImages[index],
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error, color: Colors.red),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMapSection() {
    return Stack(
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(hostelResp.location.latitude,
                    hostelResp.location.longitude),
                initialZoom: 15.0,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 40.0,
                      height: 40.0,
                      point: LatLng(hostelResp.location.latitude,
                          hostelResp.location.longitude),
                      child: const Icon(Icons.location_pin,
                          color: Colors.red, size: 40),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: ElevatedButton.icon(
            onPressed: () {
              MapsLauncher.launchCoordinates(
                  hostelResp.location.latitude, hostelResp.location.longitude);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            icon: const Icon(Icons.directions, color: Colors.white),
            label: const Text("Get Directions",
                style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _buildHostelDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetail("Rooms Available", "${hostelResp.rooms}"),
        _buildDetail("Vacancy", "${hostelResp.vacancy}"),
        _buildDetail("Monthly Rent", "₹${hostelResp.rent}"),
        Text(
          "Mess Availability: ${hostelResp.isMessAvailable}",
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
        Text(
          "Hostel Type: ${hostelResp.isMensHostel.toLowerCase() == "yes" ? "Men's Hostel" : "Women's Hostel"}",
          style: const TextStyle(color: Colors.white70, fontSize: 16),
        ),
        _buildDetail(
            "Distance from College", "${hostelResp.distFromCollege} m"),
      ],
    );
  }

  Widget _buildOwnerDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetail("Owner Name", hostelResp.ownerName),
        _buildDetail("Owner Contact", hostelResp.phoneNumber),
      ],
    );
  }

  Widget _buildDetail(String label, String value) {
    return Text(
      "$label: $value",
      style: const TextStyle(color: Colors.white70, fontSize: 16),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildActionButtons(
      {required BuildContext context, required HostelResponseModel hostel}) {
    return Column(
      children: [
        if (hostelApprovalType == 'newHostel')
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton(
                "Approve",
                Colors.green,
                () {                 
                  debugPrint("approve button working");
                  context.read<ApprovalProcessBloc>().add(
                        ApprovalProcessEvent.approvalProcessPressed(
                          rating: hostel.rating,
                          hostelImages: [],
                          hostelOwnerUserId: hostel.hostelOwnerUserId,
                          hostelId: hostel.hostelId,
                          approvalType: 'approved',
                          hostelName: hostel.hostelName,
                          ownerName: hostel.ownerName,
                          phoneNumber: hostel.phoneNumber,
                          rent: hostel.rent,
                          rooms: hostel.rooms,
                          location: LatLng(hostel.location.latitude,
                              hostel.location.longitude),
                          isEdit: false,
                          vacancy: hostel.vacancy,
                          description: hostel.description,
                          distFromCollege: hostel.distFromCollege,
                          isMessAvailable: hostel.isMessAvailable,
                          isMensHostel: hostel.isMensHostel,
                        ),
                      );
                },
              ),
              _buildActionButton("Reject", Colors.red, () {
                _showRejectDialog(
                    context: context,
                    heading: 'Reject Hostel',
                    approvalType: 'rejected',
                    hostel: hostelResp);
              }),
            ],
          )
        else if (hostelApprovalType == 'approvedHostel')
          Row(
            children: [
              _buildActionButton("Delete Hostel", Colors.red, () {
                _showRejectDialog(
                    context: context,
                    heading: 'Delete Hostel',
                    approvalType: 'deleted',
                    hostel: hostelResp);
              }),
              SizedBox(width: 20,),
              _buildActionButton("Reject", Colors.red, () {
                _showRejectDialog(
                    context: context,
                    heading: 'Reject Hostel',
                    approvalType: 'rejected',
                    hostel: hostelResp);
              })
            ],
          )
        else
          Row(
            children: [_buildActionButton("Approve", Colors.green, () {

              context.read<ApprovalProcessBloc>().add(
                        ApprovalProcessEvent.approvalProcessPressed(
                          rating: hostel.rating,
                          hostelImages: [],
                          hostelOwnerUserId: hostel.hostelOwnerUserId,
                          hostelId: hostel.hostelId,
                          approvalType: 'approved',
                          hostelName: hostel.hostelName,
                          ownerName: hostel.ownerName,
                          phoneNumber: hostel.phoneNumber,
                          rent: hostel.rent,
                          rooms: hostel.rooms,
                          location: LatLng(hostel.location.latitude,
                              hostel.location.longitude),
                          isEdit: false,
                          vacancy: hostel.vacancy,
                          description: hostel.description,
                          distFromCollege: hostel.distFromCollege,
                          isMessAvailable: hostel.isMessAvailable,
                          isMensHostel: hostel.isMensHostel,
                        ),
                      );
            })],
          )
      ],
    );
  }

  Widget _buildActionButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}

void _showRejectDialog(
    {required BuildContext context,
    required String heading,
    required String approvalType,
    required HostelResponseModel hostel}) {
  TextEditingController reasonController = TextEditingController();

  String? errorText;

  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: const Color(0xFF1E1E2C),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    heading,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // TextField
                  TextField(
                    controller: reasonController,
                    style: const TextStyle(color: Colors.white),
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: "Enter reason for this decision",
                      labelStyle: const TextStyle(color: Colors.white70),
                      errorText: errorText,
                      errorStyle: const TextStyle(color: Colors.redAccent),
                      filled: true,
                      fillColor: const Color(0xFF29293D),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),

                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Cancel Button
                      TextButton(
                        onPressed: () {
                          Navigator.pop(dialogContext);
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),

                      const SizedBox(width: 10),

                      // Confirm Button
                      ElevatedButton(
                        onPressed: () {
                          if (reasonController.text.trim().isEmpty) {
                            setState(() {
                              errorText = "Reason is required!";
                            });
                          } else {
                            
                             context.read<ApprovalProcessBloc>().add(
                                          ApprovalProcessEvent
                                              .rejectButtonPressedButton(
                                                rating: hostel.rating,
                                                reason: reasonController.text,
                                            approvalType:approvalType,
                                            hostelOwnerUserId: hostel.hostelOwnerUserId,
                                            hostelId: hostel.hostelId,
                                            hostelName:
                                                hostel.hostelName,
                                            ownerName: hostel.ownerName,
                                            phoneNumber:
                                                hostel.phoneNumber,
                                            rent: hostel.rent,
                                            rooms: hostel.rooms,
                                            vacancy: hostel.vacancy,
                                            description:
                                                hostel.description,
                                            location:LatLng(hostel.location.latitude, hostel.location.longitude),
                                            distFromCollege:
                                                hostel.distFromCollege,
                                            isMessAvailable:
                                                hostel.isMessAvailable,
                                            hostelImages: [],
                                            isMensHostel:
                                                hostel.isMensHostel,
                                            isEdit: false,
                                          ),
                                        );
                                        Navigator.pop(dialogContext);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                        ),
                        child: const Text(
                          "Confirm",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
