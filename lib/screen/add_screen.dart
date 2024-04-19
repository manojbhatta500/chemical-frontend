import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:aiapp/cubit/total_data_cubit.dart';
import 'package:aiapp/screen/chemical_List.dart';

import 'package:aiapp/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class AddChemicalScreen extends StatefulWidget {
  const AddChemicalScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return AddChemicalState();
  }
}

class AddChemicalState extends State<AddChemicalScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<TotalDataCubit>(context).changeState();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Chemical Formula'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        label: Row(
          children: [
            Text(
              'See  ALl',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.list,
              color: Colors.white,
            )
          ],
        ),
        onPressed: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => ChemicalList()));
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Chemical Formula'),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  label: const Text("Enter Chemical Formula"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextButton(
                onPressed: () async {
                  bool foundData = false;
                  // for (var i = 0; i < chemicalData.length; i++) {
                  //   var chemical = chemicalData[i];

                  //   if (controller.text.toLowerCase().trim() ==
                  //           chemical.scientificName.toLowerCase().trim() ||
                  //       chemical.commanName.toLowerCase().split(', ').any(
                  //           (name) =>
                  //               controller.text.toLowerCase().trim() ==
                  //               name.toLowerCase().trim())) {
                  //     foundData = true;
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) =>
                  //             DetailScreen(screenData: chemical),
                  //       ),
                  //     );
                  //     break;
                  //   }
                  // }

                  if (!foundData) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Sorry, we could not find your data.'),
                      ),
                    );
                  }
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                child: const Text("View Details"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
