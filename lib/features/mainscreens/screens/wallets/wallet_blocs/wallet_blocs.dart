

import 'dart:async';

import 'package:bdp_payment_app/features/mainscreens/screens/wallets/wallet_blocs/wallet_events.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/wallet_blocs/wallet_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletBloc extends Bloc<WalletEvents, WalletState> {
  WalletBloc() : super(WalletState()) {
    on<WalletAmountEvent>(_getAmountEvent);
    on<RefNumberEvent>(_getRefNumberEvent);
    on<WalletTransferIdEvent>(_getTransferIdEvent);
    on<WalletDescriptionEvent>(_getDescriptionEvent);
    on<GetWalletsEvent>(_getWalletEvent);
    on<SubmitDataEvent>(_getSubmitDataEvent);
    on<ResetDataEvent>(_getResetDataEvent);
    on<SaveWalletEvent>(_saveWalletvent);
    on<GetCurrentWalletEvent>(_getCurrentWallet);
  }


  FutureOr<void> _getAmountEvent(WalletAmountEvent event, Emitter<WalletState> emit) {
    emit(state.copyWith(amount: event.value));
  }

  FutureOr<void> _getRefNumberEvent(RefNumberEvent event, Emitter<WalletState> emit) {
    emit(state.copyWith(refNumber: event.value));
  }

  FutureOr<void> _getTransferIdEvent(WalletTransferIdEvent event, Emitter<WalletState> emit) {
    emit(state.copyWith(transferId: event.value));
  }

  FutureOr<void> _getDescriptionEvent(WalletDescriptionEvent event, Emitter<WalletState> emit) {
    emit(state.copyWith(description: event.value));
  }

  FutureOr<void> _getWalletEvent(GetWalletsEvent event, Emitter<WalletState> emit) {
    emit(state.copyWith(savedWallets: event.wallets));
  }

  FutureOr<void> _getSubmitDataEvent(SubmitDataEvent event, Emitter<WalletState> emit) {
    emit(state.copyWith(submitData: event.value));
  }

  FutureOr<void> _getResetDataEvent(ResetDataEvent event, Emitter<WalletState> emit) {
    emit(state.copyWith(
      submitData: false,
      amount: "",
      transferId: "",
      refNumber: "",
      description: "",
      currentWallet: null,
      saveWalletForFuture: false
    ));
  }

  FutureOr<void> _saveWalletvent(SaveWalletEvent event, Emitter<WalletState> emit) {
    emit(state.copyWith(saveWalletForFuture: event.value));
  }

  FutureOr<void> _getCurrentWallet(GetCurrentWalletEvent event, Emitter<WalletState> emit) {
    emit(state.copyWith(currentWallet: event.model));
  }
}