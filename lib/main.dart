import 'package:aiapp/cubits/all_chemical/all_chemical_cubit.dart';
import 'package:aiapp/repository/all_chemical_repository.dart';
import 'package:aiapp/screen/home_screen.dart';

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
      create: (context) => AllChemicalCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Testing App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
