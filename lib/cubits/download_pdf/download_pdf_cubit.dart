import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'download_pdf_state.dart';

class DownloadPdfCubit extends Cubit<DownloadPdfState> {
  DownloadPdfCubit() : super(DownloadPdfInitial());
}
