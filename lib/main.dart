import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jordon/camp/presentation/controller/Local_cubit.dart';
import 'package:jordon/camp/presentation/screens/main_screen.dart';

import 'camp/presentation/screens/test.dart';
import 'core/services/services_locator.dart';

void main() async {
  ServiceLocator().init();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp

  ({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalCubit(sl())..getCamps(),
      child: MaterialApp(
        title: 'Geeks',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  const MainScreen(),
      ),
    );
  }
}


