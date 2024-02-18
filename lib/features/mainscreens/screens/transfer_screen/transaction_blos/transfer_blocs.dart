
import 'dart:async';

import 'package:bdp_payment_app/common/constants/general_repository.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_screen/transaction_blos/transfer_events.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_screen/transaction_blos/transfer_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferBloc extends Bloc<TransferEvents, TransferStates> {
  TransferBloc() : super(TransferStates()){
    on<AccountName>(_accountNameEvent);
    on<AmountEvent>(_amountEvent);
    on<DescriptionEvent>(_descriptionEvent);
    on<AccountNumber>(_accountNumberEvent);
    on<TransferIdEvent>(_transferIdEvent);
    on<CompletingTransferEvent>(_completingTransferEvent);
    on<ResetTransferData>(_resetTransferData);
    on<OtpEvent>(_getOtpData);
  }

  FutureOr<void> _accountNameEvent(AccountName event, Emitter<TransferStates> emit) {
    emit(state.copyWith(accountName: event.name));
  }

  FutureOr<void> _amountEvent(AmountEvent event, Emitter<TransferStates> emit) {
    var editedAmount = "";
    if (event.amount!.isNotEmpty) {
      editedAmount = GeneralRepository.formatNumber(value: num.parse(event.amount!));
    }

    emit(state.copyWith(amount: editedAmount));
  }

  FutureOr<void> _descriptionEvent(DescriptionEvent event, Emitter<TransferStates> emit) {
    emit(state.copyWith(description: event.desc));
  }

  FutureOr<void> _accountNumberEvent(AccountNumber event, Emitter<TransferStates> emit) {
    emit(state.copyWith(accountNumber: event.accountNum));
  }

  FutureOr<void> _completingTransferEvent(CompletingTransferEvent event, Emitter<TransferStates> emit) {
    emit(state.copyWith(completingTransfer: event.completingTransfer));
  }

  FutureOr<void> _resetTransferData(ResetTransferData event, Emitter<TransferStates> emit) {
    emit(state.copyWith(
        accountName: "",
      amount: "0.00",
      description: "",
      accountNumber: "",
      otp: "",
      transferId: "",
      completingTransfer: false
    ));
  }

  FutureOr<void> _getOtpData(OtpEvent event, Emitter<TransferStates> emit) {
    emit(state.copyWith(otp: event.otp));
  }

  FutureOr<void> _transferIdEvent(TransferIdEvent event, Emitter<TransferStates> emit) {
    emit(state.copyWith(transferId: event.id));
  }
}