import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourgenie/cubit/app_cubit_logics.dart';
import 'package:tourgenie/cubit/app_cubits.dart';
import 'package:tourgenie/screens/detail_page.dart';
import 'package:tourgenie/screens/nav_pages/main_page.dart';
import 'package:tourgenie/screens/welcome_page.dart';
import 'package:tourgenie/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme:
              BottomNavigationBarThemeData(backgroundColor: Colors.white)),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(data: DataServices()),
        child: AppCubitLogics(),
      ),
    );
  }
}
