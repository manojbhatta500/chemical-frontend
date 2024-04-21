import 'dart:convert';
import 'dart:developer';

import 'package:aiapp/apis.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/all_chemical_model.dart';

class AllChemicalRepository {
  final url = Apis.allChemicalApi;
  final Dio dio = Dio();

  Future<Either<int, List<AllChemicalModel>>> fetchAllChemicalData() async {
    try {
      final response = await dio.get(url);
      log(response.statusCode.toString());
      log(response.data.toString()); // Corrected line

      if (response.statusCode == 200) {
        var responseData = response.data;
        List<Map<String, dynamic>> responseDataList =
            List<Map<String, dynamic>>.from(responseData);
        List<AllChemicalModel> chemical = responseDataList
            .map((json) => AllChemicalModel.fromJson(json))
            .toList();

        return Right(chemical);
      } else {
        return const Left(0);
      }
    } catch (error) {
      throw Exception('Failed to fetch data: $error');
    }
  }
}
