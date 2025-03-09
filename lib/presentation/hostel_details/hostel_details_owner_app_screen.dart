import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gecw_lakx/application/hostel_process/common_hostel_process/common_hostel_process_bloc.dart';
import 'package:gecw_lakx/application/room_details_owner/room_details_bloc.dart';
import 'package:gecw_lakx/core/loading_screen.dart';
import 'package:gecw_lakx/domain/hostel_process/hostel_resp_model.dart';
import 'package:gecw_lakx/presentation/chat/chat_page.dart';
import 'package:gecw_lakx/presentation/hostel_details/all_reviews_screen.dart';
import 'package:gecw_lakx/presentation/room_details/room_details_screen_owner.dart';
import 'package:gecw_lakx/presentation/update_vacancy/update_vacancy_screen.dart';
import 'package:latlong2/latlong.dart';
import 'package:maps_launcher/maps_launcher.dart';

class HostelDetailsOwnerAppScreen extends StatelessWidget {
  final HostelResponseModel hostelResp;
  final String hostelId;
  final List<String> hostelImages;
  const HostelDetailsOwnerAppScreen(
      {super.key,
      required this.hostelResp,
      required this.hostelId,
      required this.hostelImages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: Text(hostelResp.hostelName),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1E1E2C), Color(0xFF121212)], // Dark gradient
          ),
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: [
            // Horizontal Image Scroller
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hostelImages.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CachedNetworkImage(
                      height: 150,
                      cacheManager:
                          CachedNetworkImageProvider.defaultCacheManager,
                      key: UniqueKey(),
                      imageUrl: hostelImages[index],
                      width: MediaQuery.of(context).size.width - 40,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey[850],
                        child: const Icon(
                          Icons.broken_image,
                          color: Colors.white70,
                          size: 50,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            approvalStatusBox(
              context: context,
              status: hostelResp.approval.type,
              reason: hostelResp.approval.reason.isEmpty
                  ? ''
                  : hostelResp.approval.reason,
            ),
            const SizedBox(height: 20),

            

            SizedBox(height: 15,),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  _handlePressed(
                      types.User(id: 'iXZA3kQoJYXuoLG1PGune5lv8Ds1'), context);
                },
                icon: const Icon(Icons.chat, color: Colors.white),
                label: const Text(
                  "Chat with Admin",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 33, 42, 51),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadowColor: Colors.blue.withOpacity(0.4),
                  elevation: 6,
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            const Text(
              "Hostel Details",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Location: ${hostelResp.location.latitude}, ${hostelResp.location.longitude}",
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Stack(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[850],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
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
                              child: Icon(
                                Icons.location_pin,
                                color: Colors.red,
                                size: 40,
                              ),
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
                          hostelResp.location.latitude,
                          hostelResp.location.longitude);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: const Icon(Icons.directions, color: Colors.white),
                    label: const Text(
                      "Get Directions",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>RoomDetailsScreen(hostelId: hostelResp.hostelId)));
                  },
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: const Text(
                    "Add Hostel Layout",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadowColor: Colors.blue.withOpacity(0.4),
                    // elevation: 6,
                  ),
                ),
                Spacer(),
                 ElevatedButton.icon(
              onPressed: () {
                context.read<RoomDetailsBloc>().add(RoomDetailsEvent.getHostelRoomDetailsById(hostelId: hostelId));
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>UpdateVacancyScreen(hostelId: hostelId,)));
              },
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text(
                "Update Vacancy",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.blue.withOpacity(0.4),
                // elevation: 6,
              ),
            ),
              ],
            ),
            // SizedBox(height: 10,),
               
            SizedBox(height: 15,),
            Text(
              "Rooms Available: ${hostelResp.rooms}",
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            // Text(
            //   "Vacancy: ${hostelResp.vacancy}",
            //   style: const TextStyle(color: Colors.white70, fontSize: 16),
            // ),
            Text(
              "Monthly Rent: \$${hostelResp.rent} per person",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            Text(
              "Mess Availability: ${hostelResp.isMessAvailable}",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            Text(
              "Hostel Type: ${hostelResp.isMensHostel.toLowerCase() == "yes" ? "Men's Hostel" : "Women's Hostel"}",
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),

            Text(
              "Description: ${hostelResp.description}",
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            Text(
              "Distance: ${hostelResp.distFromCollege} m",
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print(hostelId);
                    context.read<CommonHostelProcessBloc>().add(
                        CommonHostelProcessEvent.getHostelById(
                            hostelId: hostelId));
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => LoadingScreen(isEdit: true)));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purpleAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Edit Details",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ScreenAllReviewsOfHostelScreen(
                              hostelId: hostelId,
                            )));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.tealAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("See All Reviews"),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Delete Button
            ElevatedButton(
              onPressed: () {
                _showDeleteDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Delete Hostel",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Hostel"),
          content: const Text(
              "Are you sure you want to delete this hostel? This action cannot be undone."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => LoadingScreen()));
                context.read<CommonHostelProcessBloc>().add(
                    CommonHostelProcessEvent.deleteButtonPressed(
                        hostelId: hostelId,
                        hostelOwnerUserId: hostelResp.hostelOwnerUserId));
              },
              child: const Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _handlePressed(types.User otherUser, BuildContext context) async {
    final room = await FirebaseChatCore.instance.createRoom(otherUser);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => ChatPage(room: room)));
  }
}

Widget approvalStatusBox({
  required BuildContext context,
  required String status,
  required String reason,
}) {
  bool isApproved = status == "approved";
  bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

  return Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: isDarkMode
          ? (isApproved
              ? Colors.green.shade900
              : const Color.fromARGB(255, 79, 76, 76))
          : (isApproved ? Colors.black : const Color.fromARGB(255, 79, 76, 76)),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: isApproved ? Colors.green.shade400 : Colors.red.shade400,
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 8,
          offset: const Offset(2, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              size: 20,
              isApproved ? Icons.check_circle : Icons.error,
              color: isApproved ? Colors.green : Colors.red,
            ),
            const SizedBox(width: 8),
            Text(
              "Status: $status",
              style: TextStyle(
                color: isApproved ? Colors.green : Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          "Reason: $reason",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
      ],
    ),
  );
}
