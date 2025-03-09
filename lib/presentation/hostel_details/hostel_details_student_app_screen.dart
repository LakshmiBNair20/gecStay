import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gecw_lakx/application/hostel_process/common_hostel_process/common_hostel_process_bloc.dart';
import 'package:gecw_lakx/application/room_details_owner/room_details_bloc.dart';
import 'package:gecw_lakx/domain/hostel_process/hostel_resp_model.dart';
import 'package:gecw_lakx/presentation/chat/chat_page.dart';
import 'package:gecw_lakx/presentation/hostel_booking_layout/room_selection_screen.dart';
import 'package:gecw_lakx/presentation/hostel_details/widgets/build_detail_widget.dart';
import 'package:gecw_lakx/presentation/hostel_details/widgets/build_review_widget.dart';
import 'package:latlong2/latlong.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:share_plus/share_plus.dart'; // Add this package
import 'package:url_launcher/url_launcher.dart';

@immutable
class HostelDetailsStudentAppScreen extends StatefulWidget {
  final HostelResponseModel hostelResp;
  final String userId;

  const HostelDetailsStudentAppScreen({
    super.key,
    required this.userId,
    required this.hostelResp,
  });

  @override
  HostelDetailsStudentAppScreenState createState() =>
      HostelDetailsStudentAppScreenState();
}

class HostelDetailsStudentAppScreenState
    extends State<HostelDetailsStudentAppScreen> {
  double _userRating = 4.0; // Default rating
  List<Map<String, String>> reviews = [];

  @override
  void initState() {
    super.initState();
    context.read<CommonHostelProcessBloc>().add(
        CommonHostelProcessEvent.getAllratingsAndReview(
            hostelId: widget.hostelResp.hostelId));
  }

  // Function to generate a deep link for the hostel
  String generateHostelDeepLink(String hostelId) {
    // Use the App Link (https) or Deep Link (custom scheme) based on your preference
    return "https://deep-link-redirect.onrender.com/hostel?hostelId=$hostelId"; // App Link
    // return "flutterDeepLink://gecstay/hostel?hostelId=$hostelId"; // Deep Link
  }

  void _openAddReviewModal() {
    final TextEditingController reviewController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Rate and Review",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  RatingBar.builder(
                    initialRating: _userRating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        _userRating = rating;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: reviewController,
                    maxLines: 3,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Write your review here...",
                      hintStyle: const TextStyle(color: Colors.white70),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white70),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: Colors.deepPurpleAccent),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (reviewController.text.trim().isNotEmpty) {
                          setState(() {
                            reviews.add({
                              'rating': _userRating.toString(),
                              'review': reviewController.text.trim(),
                            });
                          });
                          context.read<CommonHostelProcessBloc>().add(
                                  CommonHostelProcessEvent
                                      .submitReviewButtonPressed(
                                stars: _userRating.toString(),
                                userId: widget.userId,
                                userName: "Anonymous",
                                comment: reviewController.text.trim(),
                                hostelId: widget.hostelResp.hostelId,
                                hostelOwnerUserId:
                                    widget.hostelResp.hostelOwnerUserId,
                              ));
                          Navigator.pop(context);
                          context.read<CommonHostelProcessBloc>().add(
                              CommonHostelProcessEvent.getAllratingsAndReview(
                                  hostelId: widget.hostelResp.hostelId));
                        }
                      },
                      child: const Text(
                        "Submit Review",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<CommonHostelProcessBloc>().add(
            CommonHostelProcessEvent.getAllratingsAndReview(
                hostelId: widget.hostelResp.hostelId));
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey[900],
          title: Text(
            widget.hostelResp.hostelName,
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.call),
                  onPressed: () async {
                    final phoneNumber = widget.hostelResp.phoneNumber;
                    final url = 'tel:$phoneNumber';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Could not launch the phone dialer.'),
                        ),
                      );
                    }
                  },
                  color: Colors.white,
                ),
                IconButton(
                  icon: const Icon(Icons.chat),
                  onPressed: () {
                    _handlePressed(
                      types.User(id: widget.hostelResp.hostelOwnerUserId),
                      context,
                    );
                  },
                  color: Colors.white,
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () async {
                    final deepLink = generateHostelDeepLink(widget.hostelResp.hostelId);
                    await Share.share(
                      'Check out this hostel: $deepLink',
                      subject: 'Hostel Link',
                    );
                  },
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
        body: BlocConsumer<CommonHostelProcessBloc, CommonHostelProcessState>(
          listener: (context, state) {
            state.getAllRatingsSuccessOrFailure.fold(() {}, (either) {
              either.fold((f) {}, (s) {
                setState(() {
                  reviews = s;
                });
              });
            });
          },
          builder: (context, state) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 75),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Horizontal Photo Scroller
                        _buildPhotoScroller(),
                        const SizedBox(height: 20),
                        // Hostel Details Section
                        _buildDetailsSection(),
                        const SizedBox(height: 25),

                        reviews.isEmpty
                            ? const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "No Reviews",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            : ReviewList(reviews: reviews),
                      ],
                    ),
                  ),
                ),
                _buildBookNowButton(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildPhotoScroller() {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.hostelResp.hostelImages.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                cacheManager: DefaultCacheManager(),
                key: UniqueKey(),
                imageUrl: widget.hostelResp.hostelImages[index],
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
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDetail("Owner Name", widget.hostelResp.ownerName),
          buildDetail("Rent", "₹${widget.hostelResp.rent}/month"),
          buildDetail("Rooms Available", widget.hostelResp.rooms),
          buildDetail("Monthly Rent", "₹${widget.hostelResp.rent} per person"),
          buildDetail("Mess Availability",
              " ${widget.hostelResp.isMessAvailable.toLowerCase() == "yes" ? "Available" : "Not Available"}"),
          buildDetail(
              "Hostel Type",
              widget.hostelResp.isMensHostel.toLowerCase() == "yes"
                  ? "Men's Hostel"
                  : "Women's Hostel"),
          buildDetail("Description", widget.hostelResp.description),
          buildDetail("Distance", "${widget.hostelResp.distFromCollege} m"),
          const SizedBox(height: 20),
          const SizedBox(
            height: 15,
          ),
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
                      initialCenter: LatLng(widget.hostelResp.location.latitude,
                          widget.hostelResp.location.longitude),
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
                            point: LatLng(widget.hostelResp.location.latitude,
                                widget.hostelResp.location.longitude),
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
                        widget.hostelResp.location.latitude,
                        widget.hostelResp.location.longitude);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
          SizedBox(
            height: 15,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Icons.add_comment, color: Colors.white),
            label: const Text("Add a Review",
                style: TextStyle(color: Colors.white)),
            onPressed: _openAddReviewModal,
          ),
        ],
      ),
    );
  }

  Widget _buildBookNowButton() {
    return BlocListener<RoomDetailsBloc, RoomDetailsState>(
      listener: (context, state) {
        state.fetchSuccessOrFailureOption.fold(() {}, (either) {
          either.fold((f) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('No rooms available or try again later..')));
          }, (s) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => RoomSelectionScreen(rooms: s, hostelResp: widget.hostelResp)));
          });
        });
      },
      child: BlocBuilder<RoomDetailsBloc, RoomDetailsState>(
        builder: (context, state) {
          return Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: state.isSubmitting
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
                      onPressed: () {
                        context.read<RoomDetailsBloc>().add(
                            RoomDetailsEvent.getHostelRoomDetailsById(
                                hostelId: widget.hostelResp.hostelId));
                      },
                      child: const Text(
                        "Book Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }

  void _handlePressed(types.User otherUser, BuildContext context) async {
    final room = await FirebaseChatCore.instance.createRoom(otherUser);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => ChatPage(room: room)));
  }
}