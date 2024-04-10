import 'dart:convert';
import 'dart:developer';

import 'package:aiapp/models/chemical.dart';
import 'package:aiapp/repository/tdata_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'total_data_state.dart';

class TotalDataCubit extends Cubit<TotalDataState> {
  TDataRepository manager = TDataRepository();
  TotalDataCubit() : super(TotalDataInitial());

  void changeState() async {
    emit(TotalDataLoading());
    final reporesponse = await manager.getTotalData();

    reporesponse.fold(
        (l) => {log('success'), emit(TotalDataSuccess(chemicaldata: l))},
        (r) => {log('failed'), emit(TotalDataFailed())});
  }
}
