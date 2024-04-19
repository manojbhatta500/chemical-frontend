import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'individual_chemical_state.dart';

class IndividualChemicalCubit extends Cubit<IndividualChemicalState> {
  IndividualChemicalCubit() : super(IndividualChemicalInitial());
}
