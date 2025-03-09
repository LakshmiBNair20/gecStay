import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gecw_lakx/domain/hostel_process/hostel_resp_model.dart';
import 'package:gecw_lakx/presentation/hostel_details/hostel_details_student_app_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../application/hostel_process/common_hostel_process/common_hostel_process_bloc.dart';

class StudentHomeScreen extends StatefulWidget {

  final GlobalKey filterKey;

  final GlobalKey hostelKey;

  final GlobalKey searchKey;

  final GlobalKey ratingKey;

   const StudentHomeScreen({super.key, required this.filterKey, required this.hostelKey, required this.searchKey, required this.ratingKey, });

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  List<HostelResponseModel>? hostelResponseModel;
  List<HostelResponseModel>? allHostels; // Backup for the original list
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";
  bool? noDataFound;



  @override
  void initState() {
    super.initState();
    _loadHostels();
   
  }

  Future<void> _loadHostels() async {
    context.read<CommonHostelProcessBloc>().add(CommonHostelProcessEvent.getAllHostelList());
  }

  void _openFilterModal() {
  double _minFees = 0;
  double _maxFees = 10000;
  double _selectedRating = 0;
  double _selectedDistance = 5000; // Default max distance in meters
  bool? _withMess;
  bool? _isMensHostel;

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.grey[900],
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setModalState) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Filter Options",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Hostel Fees Filter
                  const Text(
                    "Hostel Fees (₹):",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  RangeSlider(
                    values: RangeValues(_minFees, _maxFees),
                    min: 0,
                    max: 10000,
                    divisions: 20,
                    labels: RangeLabels(
                        '₹${_minFees.round()}', '₹${_maxFees.round()}'),
                    onChanged: (values) {
                      setModalState(() {
                        _minFees = values.start;
                        _maxFees = values.end;
                      });
                    },
                    activeColor: Colors.deepPurpleAccent,
                    inactiveColor: Colors.white30,
                  ),
                  const SizedBox(height: 20),

                  // Minimum Rating Filter
                  const Text(
                    "Minimum Rating:",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  Slider(
                    value: _selectedRating,
                    min: 0,
                    max: 5,
                    divisions: 10,
                    label: _selectedRating.toStringAsFixed(1),
                    onChanged: (value) {
                      setModalState(() {
                        _selectedRating = value;
                      });
                    },
                    activeColor: Colors.amber,
                    inactiveColor: Colors.white30,
                  ),
                  const SizedBox(height: 20),

                  // Distance Filter
                  const Text(
                    "Maximum Distance (meters):",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  Slider(
                    value: _selectedDistance,
                    min: 0,
                    max: 5000,
                    divisions: 10,
                    label: "${_selectedDistance.round()} m",
                    onChanged: (value) {
                      setModalState(() {
                        _selectedDistance = value;
                      });
                    },
                    activeColor: Colors.blueAccent,
                    inactiveColor: Colors.white30,
                  ),
                  const SizedBox(height: 20),

                  // Mess Availability Filter
                  const Text(
                    "Mess Availability:",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<bool?>(
                          value: true,
                          groupValue: _withMess,
                          title: const Text(
                            "Hostel with Mess",
                            style: TextStyle(color: Colors.white70),
                          ),
                          onChanged: (value) {
                            setModalState(() {
                              _withMess = value;
                            });
                          },
                          activeColor: Colors.deepPurpleAccent,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<bool?>(
                          value: false,
                          groupValue: _withMess,
                          title: const Text(
                            "Hostel without Mess",
                            style: TextStyle(color: Colors.white70),
                          ),
                          onChanged: (value) {
                            setModalState(() {
                              _withMess = value;
                            });
                          },
                          activeColor: Colors.deepPurpleAccent,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Hostel Type Filter
                  const Text(
                    "Hostel Type:",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<bool?>(
                          value: true,
                          groupValue: _isMensHostel,
                          title: const Text(
                            "Men's Hostel",
                            style: TextStyle(color: Colors.white70),
                          ),
                          onChanged: (value) {
                            setModalState(() {
                              _isMensHostel = value;
                            });
                          },
                          activeColor: Colors.deepPurpleAccent,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<bool?>(
                          value: false,
                          groupValue: _isMensHostel,
                          title: const Text(
                            "Women's Hostel",
                            style: TextStyle(color: Colors.white70),
                          ),
                          onChanged: (value) {
                            setModalState(() {
                              _isMensHostel = value;
                            });
                          },
                          activeColor: Colors.deepPurpleAccent,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Apply Filters Button
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          hostelResponseModel = allHostels?.where((hostel) {
                            final rent = double.tryParse(hostel.rent) ?? 0;
                            final distance = double.tryParse(hostel.distFromCollege) ?? 0; // Ensure distance is in meters
                            final messCondition = _withMess == null
                                ? true
                                : hostel.isMessAvailable.toLowerCase() ==
                                    (_withMess! ? "yes" : "no");
                            final hostelTypeCondition = _isMensHostel == null
                                ? true
                                : hostel.isMensHostel.toLowerCase() ==
                                    (_isMensHostel! ? "yes" : "no");
                            final ratingCondition =
                                double.parse(hostel.rating) >= _selectedRating;
                            final distanceCondition =
                                distance <= _selectedDistance;

                            return rent >= _minFees &&
                                rent <= _maxFees &&
                                messCondition &&
                                ratingCondition &&
                                distanceCondition &&
                                hostelTypeCondition;
                          }).toList();
                        });
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Apply Filters",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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


  Widget _buildNoDataFoundWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.sentiment_dissatisfied,
            color: Colors.white70,
            size: 80,
          ),
          const SizedBox(height: 20),
          const Text(
            "No hostels found!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Try adjusting your search or filter criteria.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white54,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildHostelList(List<HostelResponseModel> filteredHostels) {
    return RefreshIndicator(
      
    onRefresh: () async {
      context.read<CommonHostelProcessBloc>().add(CommonHostelProcessEvent.getAllHostelList());
    },
      child: Showcase(
        key: widget.hostelKey,
        description: "Hostel's Will list here. You can open and view the details..",
        child: ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: filteredHostels.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final hostel = filteredHostels[index];
            return GestureDetector(
              onTap: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                String? userId = prefs.getString("owner_userid");
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HostelDetailsStudentAppScreen(
                         hostelResp: hostel,
                         userId: userId.toString(),
                        )));
              },
              child: Card(
                color: Colors.grey[850],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: CachedNetworkImage(
                        height: 150,
                        imageUrl: hostel.hostelImages[0],
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
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
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hostel.hostelName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            hostel.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: '₹${hostel.rent}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  children: const [
                                    TextSpan(
                                      text: ' /month',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                               Row(
                                children: [
                                  Icon(Icons.star, color: Colors.amber, size: 20),
                                  SizedBox(width: 4),
                                  Text(
                                    double.parse(hostel.rating).toStringAsFixed(2),
                                   
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 14),
                                  ),
                                ],
                                                             )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
       onWillPop: () async {
      if (_isSearching || hostelResponseModel != allHostels) {
        // Reset to the full list and exit search mode if necessary
        setState(() {
          _isSearching = false;
          _searchController.clear();
          _searchQuery = "";
          hostelResponseModel = allHostels;
        });
        return false; // Prevent default back action
      }
      return true; // Allow default back action (close the app)
    },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          foregroundColor: Colors.white,
          elevation: 0,
          backgroundColor: Colors.grey[850],
          title: _isSearching
              ? TextField(
                  controller: _searchController,
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value.trim();
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.white70),
                    border: InputBorder.none,
                  ),
                )
              : const Text(
                  "Explore Hostels",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
          actions: [
            Showcase(
              key: widget.searchKey,
              title: "Search",
              description: "You can search for the hostels here",
              child: IconButton(
                icon: Icon(_isSearching ? Icons.clear : Icons.search),
                onPressed: () {
                  setState(() {
                    if (_isSearching) {
                      _searchController.clear();
                      _searchQuery = "";
                    }
                    _isSearching = !_isSearching;
                  });
                },
              ),
            ),
            Showcase(
              key: widget.filterKey,
              title: "Filter option",
              description: "You can filter the hostels here",
              child: IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: _openFilterModal,
              ),
            ),
          ],
        ),
        body: BlocConsumer<CommonHostelProcessBloc, CommonHostelProcessState>(
          listener: (context, state) {
            state.hostelGetFailureOrSuccess.fold(() {}, (either) {
              either.fold((failure) {
                failure.maybeWhen(
                  noDataFound: () {
                    setState(() {
                      noDataFound = true;
                    });
                  },
                  orElse: () {},
                );
                final message = failure.maybeWhen(
                  serviceUnavailable: () =>
                      "Service unavailable. Try again later.",
                  orElse: () => "An error occurred. Please try again.",
                );
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
              }, (hostels) {
                setState(() {
                  noDataFound = false;
                  allHostels = hostels;
                  hostelResponseModel = hostels;
                });
              });
            });
          },
          builder: (context, state) {
            if (noDataFound == true) {
              return _buildNoDataFoundWidget();
            }

            if (hostelResponseModel == null) {
              return const Center(
                child:
                    CircularProgressIndicator(color: Colors.deepPurpleAccent),
              );
            }

            final filteredHostels = hostelResponseModel!
                .where((hostel) => hostel.hostelName
                    .toLowerCase()
                    .contains(_searchQuery.toLowerCase()))
                .toList();

            if (filteredHostels.isEmpty) {
              return _buildNoDataFoundWidget();
            }

            return _buildHostelList(filteredHostels);
          },
        ),
      ),
    );
  }
}
