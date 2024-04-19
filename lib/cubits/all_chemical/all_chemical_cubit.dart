import 'dart:developer';

import 'package:aiapp/models/all_chemical_model.dart';
import 'package:aiapp/repository/all_chemical_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

part 'all_chemical_state.dart';

class AllChemicalCubit extends Cubit<AllChemicalState> {
  AllChemicalCubit() : super(AllChemicalInitial());

  AllChemicalRepository manager = AllChemicalRepository();

  void getAllDataFromRepository() async {
    emit(AllChemicalLoading());
    final respo = await manager.fetchAllChemicalData();

    log(respo.toString());

    respo.fold((l) => {emit(AllChemicalFailure())},
        (r) => {emit(AllChemicalSuccess(chemicals: r))});
  }
}
