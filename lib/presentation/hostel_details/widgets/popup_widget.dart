import 'package:flutter/material.dart';

void _showRejectDialog(BuildContext context) {
  TextEditingController reasonController = TextEditingController();
  String? errorText;

  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text("Reject Hostel"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: reasonController,
                  decoration: InputDecoration(
                    labelText: "Enter reason for rejection",
                    errorText: errorText,
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext); // Close the dialog
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (reasonController.text.trim().isEmpty) {
                    setState(() {
                      errorText = "Reason is required!";
                    });
                  } else {
                    Navigator.pop(dialogContext);
                    // Perform reject action here
                    print("Rejected with reason: ${reasonController.text}");
                  }
                },
                child: const Text("Confirm"),
              ),
            ],
          );
        },
      );
    },
  );
}

