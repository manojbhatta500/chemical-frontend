part of 'download_pdf_cubit.dart';

sealed class DownloadPdfState extends Equatable {
  const DownloadPdfState();

  @override
  List<Object> get props => [];
}

final class DownloadPdfInitial extends DownloadPdfState {}

final class DownloadPdfLoading extends DownloadPdfState {}

final class DownloadPdfSuccess extends DownloadPdfState {}

final class DownloadPdfFailed extends DownloadPdfState {}
