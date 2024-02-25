//
// import 'package:intl/intl.dart';
// import 'package:zuberi/extensions/int_extension.dart';
//
import 'package:intl/intl.dart';

extension StringExtension on String{

  String capitalize() {
    if(isEmpty) return '';
    String firstChar = trim()[0].toUpperCase();
    String remainChars = trim().substring(1);

    return firstChar + remainChars;
  }

  String get ucWords => replaceAll(RegExp('\\s+'), ' ').toLowerCase().split(" ").map((str) => str.capitalize()).join(" ");

  String get toUpperKebabCase => ucWords.split("-").map((str) => str.capitalize()).join("-");

  String get toCurrencyFormat => NumberFormat('#,###,###.##').format(double.parse(replaceAll(',', ''))).toString();


  String truncate([int value = 20]) {
    return trim().isEmpty? '' : length > value ? '${substring(0, value)}...' : this;
  }

  String toNetworkName(){
    if(toLowerCase() == 'vod') return 'Vodafone';
    if(toLowerCase() == 'atl') return 'AirtelTigo';
    if(toLowerCase() == 'gmo') return 'G-Money';

    return this;
  }

  String toNetworkCode(){
    if(toLowerCase() == 'vodafone') return 'vod';
    if(toLowerCase() == 'airteltigo') return 'atl';
    if(toLowerCase() == 'g-money') return 'gmo';

    return toLowerCase();
  }

}