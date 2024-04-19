import 'dart:convert';
import 'dart:developer';
import 'package:aiapp/models/all_chemical_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:universal_html/html.dart' as html;
import '../widgtes/card_widget.dart';
import 'package:open_file/open_file.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required this.chemicalData});

  AllChemicalModel chemicalData;

  @override
  Widget build(BuildContext context) {
    log(chemicalData.commonNames.toString());

    log(chemicalData.scientificName.toString());

    log(chemicalData.file.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chemical Details'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        label: Row(
          children: [
            Text(
              'Download Pdf',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.download,
              color: Colors.white,
            )
          ],
        ),
        onPressed: () async {
          log('before downloading');

          final String apiUrl =
              'https://backend.anusabi.shop/api/v1/pdf/file?fileName=${chemicalData.file}';

          final Dio dio = Dio();
          try {
            final response =
                await dio.download(apiUrl, '/pdfs/${chemicalData.file}.pdf');

            log('Download successful');
          } catch (error) {
            log('Failed to download file: $error');
          }

          log('after downloading downloading');
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
