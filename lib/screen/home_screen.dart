import 'package:aiapp/cubits/all_chemical/all_chemical_cubit.dart';
import 'package:aiapp/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AllChemicalCubit>(context).getAllDataFromRepository();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              color: Colors.blue[700],
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  ListTile(
                    leading: Image.asset(
                      "assets/logo.png",
                      height: 50,
                      width: 50,
                    ),
                    title: const Text(
                      "Chemical Formula",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Image.asset("assets/flag.png"),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        label: const Text(
                          "Enter Chemical Formula",
                          style: TextStyle(color: Colors.white),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            8.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<AllChemicalCubit, AllChemicalState>(
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case AllChemicalLoading:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case AllChemicalSuccess:
                      final s = state as AllChemicalSuccess;
                      return ListView.builder(
                          itemCount: s.chemicals.length,
                          itemBuilder: (context, int index) {
                            String serverString =
                                s.chemicals[index].commonNames.toString();

                            String result = serverString
                                .replaceAll(RegExp(r'[\[\]" ]'), '')
                                .trim();
                            print(result);
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                            chemicalData: s.chemicals[index])));
                              },
                              child: Container(
                                height: 70,
                                width: double.infinity,
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color:
                                        Colors.lightBlueAccent.withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      s.chemicals[index].scientificName
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                    Text(result)
                                  ],
                                ),
                              ),
                            );
                          });

                    default:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
