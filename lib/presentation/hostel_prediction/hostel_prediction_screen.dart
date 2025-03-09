import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gecw_lakx/application/hostel_prediction/hostel_prediction_bloc.dart';

class HostelPredictionScreen extends StatefulWidget {
  const HostelPredictionScreen({super.key});

  @override
  _HostelPredictionScreenState createState() => _HostelPredictionScreenState();
}

class _HostelPredictionScreenState extends State<HostelPredictionScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _incomeController = TextEditingController();
  final TextEditingController _sgpaController = TextEditingController();
  String? _selectedDistrict;
  String? _selectedCategory;
  String? _selectedGender;
  String? _selectedSemester;

  final List<String> _districts = [
    'Trivandrum', 'Kollam', 'Pathanamthitta', 'Alappuzha', 'Kottayam',
    'Idukki', 'Ernakulam', 'Trichur', 'Palakkad', 'Malappuram', 'Calicut',
    'Kannur', 'Kasaragod', 'Wayanad', 'Out Side Kerala'
  ];
  final List<String> _categories = ['GENERAL', 'BPL', 'SC', 'ST','OEC','OBC'];
  final List<String> _genders = ['Male', 'Female'];
  final List<String> _semesters = ['S1','S3', 'S5', 'S7'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Hostel Prediction', 
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            color: Colors.grey[900],
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTextField(_incomeController, 'Income', 
                        'Enter your income', TextInputType.number, Icons.money),
                    _buildTextField(_sgpaController, 'SGPA/KEAM RANK', 
                        'Enter your SGPA', TextInputType.number, Icons.school),
                    _buildDropdownField('District', _districts, _selectedDistrict, 
                        (value) => _selectedDistrict = value),
                    _buildDropdownField('Category', _categories, _selectedCategory, 
                        (value) => _selectedCategory = value),
                    _buildDropdownField('Gender', _genders, _selectedGender, 
                        (value) => _selectedGender = value),
                    _buildDropdownField('Semester', _semesters, _selectedSemester, 
                        (value) => _selectedSemester = value),
                    const SizedBox(height: 16),
                    
                    BlocConsumer<HostelPredictionBloc, HostelPredictionState>(
                      listener: (context, state) {
                        state.successOrFailureOption.fold(() {}, (either) {
                          either.fold(
                            (failure) => _showPopupDialog(
                                context, "Prediction Failed", 
                                "Please try again.", Colors.red),
                            (success) => _showPopupDialog(
                              context, "Prediction Result",
                              "Approval Prediction: ${success["approval_prediction"]}\n"
                              "Predicted Percentage: ${success["predicted_percentage"]}%\n"
                              "Predicted Score: ${success["total_score"]}\n"
                              ,
                              Colors.green),
                          );
                        });
                      },
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: state.isSubmitting
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<HostelPredictionBloc>().add(
                                      HostelPredictionEvent.hostelPredictionEventCalled(
                                        income: _incomeController.text,
                                        sgpa: _sgpaController.text,
                                        district: _selectedDistrict!,
                                        category: _selectedCategory!,
                                        gender: _selectedGender!,
                                        semester: _selectedSemester!,
                                      ),
                                    );
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 32.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            backgroundColor: Colors.deepPurple,
                          ),
                          child: state.isSubmitting
                              ? const CircularProgressIndicator(color: Colors.white)
                              : const Text('Submit',
                                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        );
                      },
                    ),

                    const SizedBox(height: 16),
                    const Text(
                      "Disclaimer: This prediction is based on data analysis and may not always be accurate.",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      String hint, TextInputType inputType, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.deepPurpleAccent),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.deepPurpleAccent)),
          filled: true,
          fillColor: Colors.grey[800],
        ),
        keyboardType: inputType,
        validator: (value) =>
            value == null || value.isEmpty ? 'Please enter your $label' : null,
      ),
    );
  }

  Widget _buildDropdownField(String label, List<String> items,
      String? selectedValue, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.deepPurpleAccent)),
          filled: true,
          fillColor: Colors.grey[800],
        ),
        items: items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item, style: const TextStyle(color: Colors.white)),
                ))
            .toList(),
        onChanged: (value) => setState(() => onChanged(value)),
        validator: (value) => value == null ? 'Please select a $label' : null,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.deepPurpleAccent),
        dropdownColor: Colors.grey[900],
      ),
    );
  }

  void _showPopupDialog(
      BuildContext context, String title, String message, Color color) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(title,
            style: TextStyle(color: color, fontWeight: FontWeight.bold)),
        content: Text(message, style: const TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK',
                style: TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
