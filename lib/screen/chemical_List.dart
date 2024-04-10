import 'package:aiapp/models/chemical_model.dart';

import 'package:aiapp/screen/detail_screen.dart';
import 'package:flutter/material.dart';

class ChemicalList extends StatelessWidget {
  const ChemicalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chemical List'),
      ),
      body: ListView.builder(
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
                                industrialApplication: 'industrialApplication',
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
                    color: Colors.lightBlueAccent.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'text',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    Text('font')
                  ],
                ),
              ),
            );
          }),
    );
  }
}
