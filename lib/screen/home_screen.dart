import 'package:aiapp/cubits/all_chemical/all_chemical_cubit.dart';
import 'package:aiapp/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
            const SizedBox(
              height: 30,
            ),
            Container(
              color: Colors.blue[700],
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/logo.png",
                        height: 120,
                        width: 120,
                      ),
                      Text(
                        "Chemical Formula",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.white, fontSize: 25),
                      ),
                      // const Spacer(),
                      // Image.asset(
                      //   "assets/flag.png",
                      //   height: 110,
                      //   width: 120,
                      // ),
                    ],
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
                          "Search Chemical Formula",
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
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case AllChemicalSuccess:
                      final s = state as AllChemicalSuccess;
                      return ListView.builder(
                          itemCount:
                              s.chemicals.length < 5 ? s.chemicals.length : 5,
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
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(10),
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
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                    Text(result)
                                  ],
                                ),
                              ),
                            );
                          });

                    default:
                      return const Center(
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
