import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourgenie/cubit/app_cubit_states.dart';
import 'package:tourgenie/cubit/app_cubits.dart';
import 'package:tourgenie/screens/detail_page.dart';
import 'package:tourgenie/screens/home_page.dart';
import 'package:tourgenie/screens/nav_pages/main_page.dart';
import 'package:tourgenie/screens/welcome_page.dart';
import 'package:tourgenie/services/data_services.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is WelcomeState) {
          return WelcomePage();
        }
        if (state is LoadingState) {
          // return Center(child: CircularProgressIndicator());
          return MainPage();
        }
        if (state is LoadedState) {
          return MainPage();
        }
        if (state is DetailState) {
          return DetailPage();
        } else {
          return Container();
        }
      },
    ));
  }
}
