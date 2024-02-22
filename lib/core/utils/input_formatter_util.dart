


import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputFormatterUtil{

  static List<MaskTextInputFormatter>? maskInput({String? mask, Map<String, RegExp>? filter}) => [
    MaskTextInputFormatter(
      mask: mask,
      filter: filter,
      type: MaskAutoCompletionType.eager,
    )
  ];

}