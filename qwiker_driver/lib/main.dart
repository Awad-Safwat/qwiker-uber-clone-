import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwiker_driver/core/di/app_bloc_observer.dart';
import 'package:qwiker_driver/driver_app.dart';
import 'package:qwiker_driver/firebase_options.dart';

import 'core/global_functions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = AppBlocObserver();
  isFirstTime = await checkFirstSeen();
  runApp(const DriverApp());
}
