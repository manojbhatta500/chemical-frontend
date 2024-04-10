import 'package:aiapp/cubit/total_data_cubit.dart';
import 'package:aiapp/screen/add_screen.dart';
import 'package:aiapp/screen/detail_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TotalDataCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Testing App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AddChemicalScreen(),
      ),
    );
  }
}
