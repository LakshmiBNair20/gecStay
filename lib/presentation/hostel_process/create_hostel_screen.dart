import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gecw_lakx/application/hostel_process/common_hostel_process/common_hostel_process_bloc.dart';
import 'package:gecw_lakx/domain/hostel_process/hostel_resp_model.dart';
import 'package:gecw_lakx/presentation/hostel_process/widget/select_location_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gecw_lakx/presentation/bottom_navigation/bottom_navigation_owner.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateHostelScreen extends StatefulWidget {
  final bool? isEdit;
  final HostelResponseModel? hostelData;
  const CreateHostelScreen({super.key, this.isEdit, this.hostelData});

  @override
  _CreateHostelScreenState createState() => _CreateHostelScreenState();
}

class _CreateHostelScreenState extends State<CreateHostelScreen> {
  final _formKey = GlobalKey<FormState>();

  // Firestore instance
  // final FirebaseFirestore db = FirebaseFirestore.instance;

  // Text controllers
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController hostelNameController = TextEditingController();
  final TextEditingController rentController = TextEditingController();
  final TextEditingController roomsController = TextEditingController();
  final TextEditingController vacancyController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController messAvailableController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController distanceController = TextEditingController();

  LatLng? _selectedLocation;

  @override
  void initState() {
    super.initState();

    if (widget.isEdit == true && widget.hostelData != null) {
      ownerNameController.text = widget.hostelData!.ownerName;
      phoneNumberController.text = widget.hostelData!.phoneNumber;
      hostelNameController.text = widget.hostelData!.hostelName;
      rentController.text = widget.hostelData!.rent;
      roomsController.text = widget.hostelData!.rooms;
      vacancyController.text = widget.hostelData!.vacancy;
      descriptionController.text = widget.hostelData!.description;
      distanceController.text = widget.hostelData!.distFromCollege;
      messAvailableController.text = widget.hostelData!.isMessAvailable;

      // Ensure correct selection for hostel type
      _selectedHostelType =
          widget.hostelData!.isMensHostel == 'Yes' ? 'Yes' : 'No';
    }
  }

  // Image picker
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFiles = [];

  String? _selectedHostelType;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommonHostelProcessBloc, CommonHostelProcessState>(
      listener: (context, state) {
        state.submitFailureOrSuccessOption.fold(() {}, (some) {
          some.fold((failure) {
            final message = failure.maybeWhen(
              serverError: () => "Server Error, Please try again later",
              serviceUnavailable: () => "Service Unavailable",
              orElse: () => "An unexpected error occurred",
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          }, (success) async {
            final prefs = await SharedPreferences.getInstance();
            final String? userId = prefs.getString('owner_userid');
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (ctx) => BottomNavigationBarOwnerWidget(
                  userId: userId.toString(),
                ),
              ),
              (route) => false,
            );
          });
        });
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            foregroundColor: Colors.white,
            title: const Text('Create Hostel'),
            backgroundColor: const Color(0xFF1F1F1F),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildTextField(ownerNameController, 'Owner Name'),
                    const SizedBox(height: 12),
                   TextFormField(
      controller: phoneNumberController,
      keyboardType: TextInputType.phone,
      // maxLines: maxLines,
      decoration: InputDecoration(
        labelText: "Phone Number",
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (value == null || value.isEmpty || value.length<10 ||value.length >10) {
          return 'Please enter a valid phone number';
        }
       
        return null;
      },
    ),
                    const SizedBox(height: 12),
                    _buildTextField(hostelNameController, 'Hostel Name'),
                    _buildHostelSelection(),
                    const SizedBox(height: 12),
                    _buildTextField(rentController, 'Rent',
                        inputType: TextInputType.number),
                    const SizedBox(height: 12),
                    _buildTextField(roomsController, 'Number of Rooms',
                        inputType: TextInputType.number),
                    const SizedBox(height: 12),
                    _buildTextField(
                        distanceController, 'Distance from College (in meter)',
                        inputType: TextInputType.number),
                    const SizedBox(height: 12),
                    _buildTextField(vacancyController, 'Vacancy',
                        inputType: TextInputType.number),
                    const SizedBox(height: 12),
                    _buildDropdown(
                      messAvailableController,
                      'Is Mess Available? (Yes/No)',
                      ['Yes', 'No'],
                    ),
                    const SizedBox(height: 12),
                    _buildTextField(descriptionController, 'Description',
                        maxLines: 3),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () async {
                            context.read<CommonHostelProcessBloc>().add(
                                CommonHostelProcessEvent
                                    .findLocationButtonPressed());
                            setState(() {
                              _selectedLocation = state.location;
                            });
                          },
                          child: Text(
                            'Get Location',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal,
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              onPressed: () async {
                                final LatLng? pickedLocation =
                                    await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SelectLocationScreen()),
                                );
                                if (pickedLocation != null) {
                                  setState(() {
                                    _selectedLocation = pickedLocation;
                                    locationController.text =
                                        "${pickedLocation.latitude}, ${pickedLocation.longitude}";
                                  });
                                }
                              },
                              child: Text('Choose Location',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            if (_selectedLocation != null)
                              Text(
                                'Location Selected!',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () async {
                        final pickedImages = await _picker.pickMultiImage();
                        setState(() {
                          _imageFiles = pickedImages ?? [];
                        });
                      },
                      child: const Text('Pick Images'),
                    ),
                    const SizedBox(height: 12),
                    _imageFiles!.isEmpty
                        ? const Text('No images selected',
                            style: TextStyle(color: Colors.white70))
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            itemCount: _imageFiles!.length,
                            itemBuilder: (context, index) {
                              return Image.file(
                                File(_imageFiles![index].path),
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                    const SizedBox(height: 20),
                    state.isSubmitting
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ElevatedButton(
                            onPressed: () async {
                              // Check if location is selected before proceeding
                              

                              if (widget.isEdit == true) {
                                print(
                                    "true is working in ui${state.hostelDataById.hostelId}");
                                context.read<CommonHostelProcessBloc>().add(
                                      CommonHostelProcessEvent
                                          .submitButtonPressed(
                                        reason: '',
                                        rating: state.hostelDataById.rating,
                                        hostelOwnerUserId: state
                                            .hostelDataById.hostelOwnerUserId,
                                        hostelId: state.hostelDataById.hostelId,
                                        hostelName: hostelNameController.text,
                                        ownerName: ownerNameController.text,
                                        phoneNumber: phoneNumberController.text,
                                        rent: rentController.text,
                                        rooms: roomsController.text,
                                        vacancy: vacancyController.text,
                                        description: descriptionController.text,
                                        location: _selectedLocation ??
                                            LatLng(11.83399, 75.97021),
                                        distFromCollege:
                                            distanceController.text,
                                        isMessAvailable:
                                            messAvailableController.text,
                                        hostelImages: _imageFiles!,
                                        isMensHostel:
                                            _selectedHostelType.toString(),
                                        isEdit: true,
                                        approvalType: 'pending',
                                      ),
                                    );
                              } else {
                                if (_selectedLocation == null) {
                                // Show a message or Snackbar prompting the user to select a location
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Please select a location')),
                                );
                                return; // Prevent form submission
                              }
                                if (_imageFiles == null ||
                                    _imageFiles!.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Please select at least one image')),
                                  );
                                  return; // Prevent form submission
                                }
                                print("ui some is working");
                                if (_formKey.currentState!.validate() &&
                                    _selectedLocation != null ) {
                                  if (_imageFiles == null) {
                                    print('add_images');
                                  } else {
                                    context.read<CommonHostelProcessBloc>().add(
                                          CommonHostelProcessEvent
                                              .submitButtonPressed(
                                            rating: '0',
                                            reason: '',
                                            approvalType: 'pending',
                                            hostelOwnerUserId: '',
                                            hostelName:
                                                hostelNameController.text,
                                            ownerName: ownerNameController.text,
                                            phoneNumber:
                                                phoneNumberController.text,
                                            rent: rentController.text,
                                            rooms: roomsController.text,
                                            vacancy: vacancyController.text,
                                            description:
                                                descriptionController.text,
                                            location: _selectedLocation ??
                                                LatLng(11.83399, 75.97021),
                                            distFromCollege:
                                                distanceController.text,
                                            isMessAvailable:
                                                messAvailableController.text,
                                            hostelImages: _imageFiles!,
                                            isMensHostel:
                                                _selectedHostelType.toString(),
                                            isEdit: false,
                                          ),
                                        );
                                  }
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 24),
                            ),
                            child: const Text(
                              'Submit & Proceed',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                    // Show a message if location is not selected
                    if (_selectedLocation == null)
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Please select a location',
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          backgroundColor: const Color(0xFF121212),
        );
      },
    );
  }

  Widget _buildHostelSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        const Text('Select Hostel Type',
            style: TextStyle(color: Colors.white70)),
        Row(
          children: [
            Expanded(
              child: RadioListTile<String>(
                title: const Text(
                  "Men's Hostel",
                  style: TextStyle(color: Colors.white),
                ),
                value: 'Yes',
                groupValue: _selectedHostelType,
                onChanged: (value) =>
                    setState(() => _selectedHostelType = value),
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                title: const Text(
                  "Women's Hostel",
                  style: TextStyle(color: Colors.white),
                ),
                value: 'No',
                groupValue: _selectedHostelType,
                onChanged: (value) =>
                    setState(() => _selectedHostelType = value),
              ),
            ),
          ],
        ),
        if (_selectedHostelType == null)
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              'Please select a hostel type',
              style: TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    TextInputType inputType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        if (label == "Phone Number" && value.length < 10 && value.length>10) {
          return 'Please enter a valid phone number';
        }
        return null;
      },
    );
  }

  Widget _buildDropdown(
    TextEditingController controller,
    String label,
    List<String> options,
  ) {
    return DropdownButtonFormField<String>(
      value: controller.text.isEmpty ? null : controller.text,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      dropdownColor: Colors.grey[850],
      items: options
          .map((option) => DropdownMenuItem(
                value: option,
                child: Text(option),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          controller.text = value ?? '';
        });
      },
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select $label';
        }
        return null;
      },
    );
  }
}
