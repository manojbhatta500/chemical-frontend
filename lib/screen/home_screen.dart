import 'package:aiapp/models/chemical_model.dart';
import 'package:aiapp/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/logo.jpeg',
                height: 200,
              ),
            ),
            SizedBox(
              height: 30,
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
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 19,
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                    screenData: ChemicalModel(
                                        benifits: 'benifits',
                                        commanName: 'commanName',
                                        geographicalDirstribution:
                                            'geographicalDirstribution',
                                        industrialApplication:
                                            'industrialApplication',
                                        mediacalUses: 'mediacalUses',
                                        metarials: 'metarials',
                                        scientificName: 'scientificName'))));
                      },
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.lightBlueAccent.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'text',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            Text('font')
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
