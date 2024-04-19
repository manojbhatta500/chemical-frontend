import 'dart:developer';

import 'package:aiapp/apis.dart';
import 'package:aiapp/models/all_chemical_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';

class AllChemicalRepository {
  Dio dio = Dio();

  final url = Apis.allChemicalApi;

  Future<Either<int, List<AllChemicalModel>>> fetchAllChemicalData() async {
    try {
      Response response = await dio.get(url);
      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data;
        List<AllChemicalModel> chemicals = responseData
            .map((json) => AllChemicalModel.fromJson(json))
            .toList();
        return Right(chemicals);
      } else {
        return Left(0);
      }
    } catch (error) {
      throw Exception('Failed to fetch data: $error');
    }
  }
}
