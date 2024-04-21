import 'package:aiapp/screen/detail_screen.dart';
import 'package:flutter/material.dart';

class SearchChemical extends StatefulWidget {
  const SearchChemical({super.key});

  @override
  State<SearchChemical> createState() => _SearchChemicalState();
}

class _SearchChemicalState extends State<SearchChemical> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: TextFormField(
            autofocus: true,
            focusNode: FocusNode(),
            decoration: const InputDecoration(
              hintText: "Search Chemical Formula",
              isDense: true,
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => DetailScreen(
                //             )));
              },
              child: Container(
                height: 70,
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "".toString(),
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    const Text("")
                  ],
                ),
              ),
            );
          }),
    );
  }
}
