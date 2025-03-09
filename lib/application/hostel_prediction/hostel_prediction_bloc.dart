import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gecw_lakx/domain/core/formfailures.dart';
import 'package:gecw_lakx/domain/hostel_prediction/i_hostel_prediction.dart';
import 'package:injectable/injectable.dart';

part 'hostel_prediction_event.dart';
part 'hostel_prediction_state.dart';
part 'hostel_prediction_bloc.freezed.dart';

@injectable
class HostelPredictionBloc
    extends Bloc<HostelPredictionEvent, HostelPredictionState> {
  final IHostelPrediction predictionApi;
  HostelPredictionBloc(this.predictionApi)
      : super(HostelPredictionState.initial()) {
    on<HostelPredictionEvent>((event, emit) async {
      await event.map(hostelPredictionEventCalled: (value) async {
        emit(state.copyWith(
          isSubmitting: true,
          successOrFailureOption: none(),
        ));
        final resp = await predictionApi.predictHostelSelection(
          income: value.income,
          sgpa: value.sgpa,
          district: value.district,
          category: value.category,
          gender: value.gender,
          semester: value.semester,
        );

        resp.fold((f){
          emit(state.copyWith(
            isSubmitting: false,
            successOrFailureOption: some(left(f)),
          ));
        }, (s){
          emit(state.copyWith(
            isSubmitting: false,
            successOrFailureOption: some(right(s)),
          ));
        });
      });
    });
  }
}
