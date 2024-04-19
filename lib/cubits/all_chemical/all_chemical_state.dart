part of 'all_chemical_cubit.dart';

sealed class AllChemicalState extends Equatable {
  const AllChemicalState();

  @override
  List<Object> get props => [];
}

final class AllChemicalInitial extends AllChemicalState {}

final class AllChemicalLoading extends AllChemicalState {}

final class AllChemicalSuccess extends AllChemicalState {
  final List<AllChemicalModel> chemicals;
  AllChemicalSuccess({required this.chemicals});
}

final class AllChemicalFailure extends AllChemicalState {}
