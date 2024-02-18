

import 'dart:async';

import 'package:bdp_payment_app/features/authentication/screens/phonenumber_authentication/phone_number_blocs/phone_number_events.dart';
import 'package:bdp_payment_app/features/authentication/screens/phonenumber_authentication/phone_number_blocs/phone_number_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneNumberBlocs extends Bloc<PhoneNumberEvents, PhoneNumberStates> {
  PhoneNumberBlocs() : super(PhoneNumberStates()) {
    on<SubmittingPhoneEvent>(_submittingEventHandler);
    on<AddMediumEvent>(_addMediumHandler);
    on<AddOtpEvent>(_addPhoneOtpHandler);
  }


  FutureOr<void> _submittingEventHandler(SubmittingPhoneEvent event, Emitter<PhoneNumberStates> emit) {
    emit(state.copyWith(isSubmitting: event.submitting));
  }

  FutureOr<void> _addMediumHandler(AddMediumEvent event, Emitter<PhoneNumberStates> emit) {
    emit(state.copyWith(medium: event.medium));
  }

  FutureOr<void> _addPhoneOtpHandler(AddOtpEvent event, Emitter<PhoneNumberStates> emit) {
    emit(state.copyWith(otp: event.otp));
  }
}