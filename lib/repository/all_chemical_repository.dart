
import 'package:aiapp/apis.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/all_chemical_model.dart';

class AllChemicalRepository {
  final url = Apis.allChemicalApi;
  final dio = Dio();

  Future<Either<int, List<AllChemicalModel>>> fetchAllChemicalData() async {
    try {
      // huebewwwww oj
      final response = await dio.get(url);
      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        var responseData = response.data;
        List<Map<String, dynamic>> responseDataList =
            List<Map<String, dynamic>>.from(responseData);
        List<AllChemicalModel> chemicals = responseDataList
            .map((json) => AllChemicalModel.fromJson(json))
            .toList();
        return Right(chemicals);
      } else {
        return const Left(0);
      }
    } catch (error) {
      throw Exception('Failed to fetch data: $error');
    }
  }
}
