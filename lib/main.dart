import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/util/services/setting_service.dart';
import 'package:task/features/login/presentation/pages/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/main_layout/presentation/bloc/main_layout_bloc.dart';
import 'package:task/features/main_layout/presentation/bloc/main_layout_bloc.dart';

import 'features/calender/presentation/bloc/calendar_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MainLayoutBloc>(create: (context) => MainLayoutBloc()),
          BlocProvider<CalendarBloc>(create: (context) => CalendarBloc()),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: getLightTheme,
          home: const LoginScreen(),
        ),
      ),
    );
  }
}


