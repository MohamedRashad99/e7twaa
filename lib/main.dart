import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:e7twa2/forgetPassword/bloc/cubit.dart';
import 'package:e7twa2/forgetPassword/bloc/state.dart';
import 'package:e7twa2/makeAppointment/bloc/cubit.dart';
import 'package:e7twa2/profile/cubit/cubit.dart';
import 'package:e7twa2/signIn/bloc/cubit.dart';
import 'package:e7twa2/signUp/bloc/cubit.dart';
import 'package:e7twa2/vaCode/bloc/cubit.dart';
import 'package:e7twa2/welcome/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'drProfile/cubit/cubit.dart';
 // TODO FCM
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>LoginControllerCubit()),
        BlocProvider(create: (_)=>SignUpControllerCubit()),
        BlocProvider(create: (_)=>VaControllerCubit()),
        BlocProvider(create: (_)=>EditProfileCubit()),
        BlocProvider(create: (_)=>EditDrCubit()),
        BlocProvider(create: (_)=>OrderCubit()),
        BlocProvider(create: (_)=>ForgetCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeView(),
      ),
    );
  }
}