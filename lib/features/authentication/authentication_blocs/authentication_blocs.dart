

import 'dart:async';

import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentiation_events.dart';
import 'package:bdp_payment_app/features/authentication/authentication_blocs/authentication_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvents, AuthenticationStates> {
  AuthenticationBloc() : super(AuthenticationStates()) {
    on<ProfilePicEvent>(_profilePicEvent);
    on<DocumentFrontEvent>(_documentFrontEvent);
    on<DocumentBackEvent>(_documentBackEvent);
    on<NameEvent>(_nameEvent);
    on<PhoneEvent>(_phoneEvent);
    on<EmailEvent>(_emailEvent);
    on<PinEvent>(_pinEvent);
    on<ConfirmPinEvent>(_confirmPinEvent);
    on<SubmittingDataEvent>(_submittingEvent);
    on<MobileMoneyEvent>(_mobileMoneyEvent);
    on<ResetAuthenticationData>(_resetAuthenticationData);
    on<DocumentBackFileEvent>(_documentBackFileEvent);
    on<DocumentFrontFileEvent>(_documentFrontFileEvent);
    on<ProfileFileEvent>(_profileFileEvent);
  }


  FutureOr<void> _profilePicEvent(ProfilePicEvent event, Emitter<AuthenticationStates> emit) {
    emit(state.copyWith(profilePic: event.file));
  }

  FutureOr<void> _documentFrontEvent(DocumentFrontEvent event, Emitter<AuthenticationStates> emit) {
    emit(state.copyWith(documentFrontPic: event.file));
  }

  FutureOr<void> _documentBackEvent(DocumentBackEvent event, Emitter<AuthenticationStates> emit) {
    emit(state.copyWith(documentBackPic: event.file));
  }

  FutureOr<void> _nameEvent(NameEvent event, Emitter<AuthenticationStates> emit) {
    emit(state.copyWith(name: event.value));
  }

  FutureOr<void> _phoneEvent(PhoneEvent event, Emitter<AuthenticationStates> emit) {
    emit(state.copyWith(phoneNumber: event.value));
  }

  FutureOr<void> _emailEvent(EmailEvent event, Emitter<AuthenticationStates> emit) {
    emit(state.copyWith(emailAddress: event.value));
  }

  FutureOr<void> _pinEvent(PinEvent event, Emitter<AuthenticationStates> emit) {
    emit(state.copyWith(pin: event.value));
  }

  FutureOr<void> _confirmPinEvent(ConfirmPinEvent event, Emitter<AuthenticationStates> emit) {
    emit(state.copyWith(confirmPin: event.value));
  }

  FutureOr<void> _submittingEvent(SubmittingDataEvent event, Emitter<AuthenticationStates> emit) {
    emit(state.copyWith(submittingData: event.value));
  }

  FutureOr<void> _mobileMoneyEvent(MobileMoneyEvent event, Emitter<AuthenticationStates> emit) {
    emit(state.copyWith(isMobileMoneyNumber: event.value));
  }

  FutureOr<void> _resetAuthenticationData(ResetAuthenticationData event, Emitter<AuthenticationStates> emit) {
    emit(state.copyWith(
      name: "",
      phoneNumber: "",
      emailAddress: "",
      pin: "",
      confirmPin: "",
      documentBackFile: null,
      documentFrontFile: null,
      documentFrontPic: null,
      documentBackPic: null,
      profileFile: null,
      profilePic: null,
    ));
  }

  FutureOr<void> _documentBackFileEvent(DocumentBackFileEvent event, Emitter<AuthenticationStates> emit) {
    emit(state.copyWith(documentBackFile: event.file));
  }

  FutureOr<void> _documentFrontFileEvent(DocumentFrontFileEvent event, Emitter<AuthenticationStates> emit) {
    emit(state.copyWith(documentFrontFile: event.file));
  }

  FutureOr<void> _profileFileEvent(ProfileFileEvent event, Emitter<AuthenticationStates> emit) {
    emit(state.copyWith(profileFile: event.file));
  }
}