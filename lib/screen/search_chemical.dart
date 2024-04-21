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
      body: Column(
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
                    const Spacer(),
                    Image.asset(
                      "assets/flag.png",
                      height: 110,
                      width: 120,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
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
        ],
      ),
    );
  }
}
