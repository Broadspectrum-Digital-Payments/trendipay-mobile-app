

import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

class NfcService{

  static final NfcService _nfcService = NfcService._internal();
  factory NfcService() => _nfcService;
  NfcService._internal();

  Future<NFCAvailability> get nfcAvailability async => await FlutterNfcKit.nfcAvailability;

  Future<String> startNfcSession() async {
    String resultText = '';
    try {
      // Start NFC session
      NFCTag tag = await FlutterNfcKit.poll(timeout: const Duration(seconds: 10),
          iosMultipleTagMessage: "Multiple tags found!", iosAlertMessage: "Scan your tag");
      if (tag.standard == "ISO 14443-4 (Type A)") {
        // Send the SELECT command for Visa AID
        String command = '00A4040007A0000000031010';
        final resp = await FlutterNfcKit.transceive(command);

        resultText = 'RESPONSE: $resp \n\n TAG: $tag';
      } else {
        resultText = 'NFC tag standard is not supported. : $tag';
      }

      // Finish NFC session
      await FlutterNfcKit.finish();
    } catch (e) {
      resultText = 'Error: $e';
    }

    return resultText;
  }

}