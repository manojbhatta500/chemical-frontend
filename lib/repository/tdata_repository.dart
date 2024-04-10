import 'dart:convert';
import 'dart:developer';

import 'package:aiapp/apis.dart';
import 'package:aiapp/models/chemical.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class TDataRepository {
  Future<Either<Chemical, int>> getTotalData() async {
    try {
      Dio dio = Dio();

      String url = Apis.totalDataAPi;

      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        print('Data fetched successfully: ${response.data}');
        //final parsed = jsonDecode(response.data);
        final chemical = Chemical.fromJson(response.data);
        log(chemical.toString());

        return Left(chemical);
      } else {
        print('Error: ${response.statusCode}');
        return Right(0);
      }
    } catch (e) {
      print('Error fetching data: $e');
      return Right(0);
    }
  }
}
