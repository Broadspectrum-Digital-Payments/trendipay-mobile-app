

class PhoneNumberStates {
  final String medium;

  final String otp;

  final bool isSubmitting;


  PhoneNumberStates({
    this.medium = "",
    this.otp = "",
    this.isSubmitting = false
});

  PhoneNumberStates copyWith({String? medium, String? otp, bool? isSubmitting}) {
    return PhoneNumberStates(
      medium: medium ?? this.medium,
      otp: otp ?? this.otp,
      isSubmitting: isSubmitting ?? this.isSubmitting
    );
  }





}