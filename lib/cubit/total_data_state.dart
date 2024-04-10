part of 'total_data_cubit.dart';

sealed class TotalDataState extends Equatable {
  const TotalDataState();

  @override
  List<Object> get props => [];
}

final class TotalDataInitial extends TotalDataState {}

final class TotalDataLoading extends TotalDataState {}

final class TotalDataSuccess extends TotalDataState {
  final Chemical chemicaldata;
  TotalDataSuccess({required this.chemicaldata});
}

final class TotalDataFailed extends TotalDataState {}
