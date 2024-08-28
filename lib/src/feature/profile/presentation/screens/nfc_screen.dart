

import 'package:bdp_payment_app/core/constants/common.dart';
import 'package:bdp_payment_app/core/services/nfc_service.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import '../../../../../core/constants/text_strings.dart';
import '../../../../../core/services/git_it_service_locator.dart';
import '../../../../shared_widgets/base/bdp_appbar.dart';
import '../../../../shared_widgets/forms/bdp_input.dart';



class NfcScreen extends StatefulWidget {
  const NfcScreen({super.key});

  @override
  State<NfcScreen> createState() => _NfcScreenState();
}

class _NfcScreenState extends State<NfcScreen> {
  ValueNotifier<dynamic> result = ValueNotifier(null);
  final nfcService = sl.get<NfcService>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BDPAppBar(
        appBar: AppBar(),
        title: BDPTexts.nfcPayment,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppThemeUtil.width(kWidthPadding)),
        child: FutureBuilder<NFCAvailability>(
          future: nfcService.nfcAvailability,
          builder: (context, ss) => ss.data != NFCAvailability.available ?
          Center(child: Text('${ss.data}', textAlign: TextAlign.center,))
              :
          Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.vertical,
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.all(4),
                  constraints: const BoxConstraints.expand(),
                  decoration: BoxDecoration(border: Border.all()),
                  child: SingleChildScrollView(
                    child: ValueListenableBuilder<dynamic>(
                        valueListenable: result,
                        builder: (context, value, _) =>
                        BDPInput(
                          controller: TextEditingController(text: '${value ?? ''}'),
                          maxLines: 20,
                        )
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: _startNfcSession,
                        child: const Text('Read NFC')),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _startNfcSession() async {
    result.value = await sl.get<NfcService>().startNfcSession();
  }
}



