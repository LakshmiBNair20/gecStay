// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:gecw_lakx/application/hostel_process/common_hostel_process/common_hostel_process_bloc.dart';
import 'package:gecw_lakx/presentation/bottom_navigation/bottom_navigation_owner.dart';
import 'package:gecw_lakx/presentation/hostel_process/create_hostel_screen.dart';

class LoadingScreen extends StatelessWidget {
  final String? userId;
  final bool? isEdit;

  const LoadingScreen({
    super.key,
    this.isEdit,
    this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark mode background
      body: Center(
        child: BlocConsumer<CommonHostelProcessBloc, CommonHostelProcessState>(
          listener: (context, state) {
            state.successOrFailure.fold(() {}, (either) {
              either.fold((f) {}, (s) {
                if (isEdit == true) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => CreateHostelScreen(
                        isEdit: true,
                          hostelData: state.hostelDataById)));
                } else {
                  context
          .read<CommonHostelProcessBloc>()
          .add(CommonHostelProcessEvent.getOwnersHostelList(userId: userId.toString()));
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (ctx) => BottomNavigationBarOwnerWidget(),
                      ),
                      (route) => false);
                }
              });
            });
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SpinKitFadingCircle(
                  color: Colors.blueAccent,
                  size: 70.0,
                ),
                const SizedBox(height: 20),
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(seconds: 2),
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: child,
                    );
                  },
                  child: const Text(
                    "Loading...",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
