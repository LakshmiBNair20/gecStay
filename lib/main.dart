import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gecw_lakx/application/approval_process/approval_process_bloc.dart';
import 'package:gecw_lakx/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:gecw_lakx/application/cart/cart_listing_bloc.dart';
import 'package:gecw_lakx/application/hostel_prediction/hostel_prediction_bloc.dart';
import 'package:gecw_lakx/application/hostel_process/common_hostel_process/common_hostel_process_bloc.dart';
import 'package:gecw_lakx/application/room_details_owner/room_details_bloc.dart';
import 'package:gecw_lakx/domain/hostel_process/hostel_resp_model.dart';
import 'package:gecw_lakx/firebase_options.dart';
import 'package:gecw_lakx/injection.dart';
import 'package:gecw_lakx/presentation/hostel_details/hostel_details_student_app_screen.dart';
import 'package:gecw_lakx/presentation/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies('prod');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://mksxoiizgunbatwgjgru.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1rc3hvaWl6Z3VuYmF0d2dqZ3J1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY3NDUwODMsImV4cCI6MjA1MjMyMTA4M30.flRm8k5nPQOoi1F63dZaL-BLvZXMLoP14cEpPur0mzA',
  );

  runApp(ShowCaseWidget(builder: (context)=> MyApp()));
}

// Global navigator key for navigation outside the widget tree
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInFormBloc>(create: (context) => getIt<SignInFormBloc>()),
        BlocProvider<ApprovalProcessBloc>(create: (context) => getIt<ApprovalProcessBloc>()),
        BlocProvider<CommonHostelProcessBloc>(create: (context) => getIt<CommonHostelProcessBloc>()),
        BlocProvider<RoomDetailsBloc>(create: (context) => getIt<RoomDetailsBloc>()),
        BlocProvider<HostelPredictionBloc>(create: (context) => getIt<HostelPredictionBloc>()),
        BlocProvider<CartListingBloc>(create: (context) => getIt<CartListingBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[900],
          appBarTheme: AppBarTheme(
            color: Colors.grey[850],
            foregroundColor: Colors.white,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        navigatorKey: navigatorKey, // Use the global navigator key
      ),
    );
  }
}

// Fetch hostel details from Firestore
Future<HostelResponseModel?> fetchHostelDetails(String hostelId) async {
  final docSnapshot = await FirebaseFirestore.instance
      .collection('all_hostel_list')
      .doc(hostelId)
      .get();

  if (docSnapshot.exists) {
    return HostelResponseModel.fromMap(docSnapshot.data()!); // Convert Firestore data to HostelResponseModel
  }
  return null;
}