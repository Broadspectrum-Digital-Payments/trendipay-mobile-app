

abstract class  PhoneNumberEvents {
  PhoneNumberEvents();
}

class AddMediumEvent extends PhoneNumberEvents {
  final String medium;
  AddMediumEvent({required this.medium});
}


class AddOtpEvent extends PhoneNumberEvents {
  final String otp;

  AddOtpEvent({required this.otp});
}

class SubmittingPhoneEvent extends PhoneNumberEvents {
  final bool submitting;
  SubmittingPhoneEvent({required this.submitting});
}