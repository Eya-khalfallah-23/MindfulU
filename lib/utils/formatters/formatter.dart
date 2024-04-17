import 'package:intl/intl.dart';

class MhFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MM-yyyy').format(date);
  }

  static String formatTime(DateTime? time) {
    time ??= DateTime.now();
    return DateFormat('hh:mm a').format(time);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  //still needs testing
  //static String formatPhoneNumber(String phoneNumber) {
    //tunisian phone number : 12 345 678
    //if (phoneNumber.length == 8) {
     // return phoneNumber;
    //} else {
     // return ('wrong phone number');
    //}
 // }

  //not fully tested
  // static String internationalFormatPhoneNumber (String phoneNumber){
  //   //remove any digits and characters from the phone number
  //   var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');
  //
  //   //extract the country code from the digitsOnly
  //   String countryCode = '+${digitsOnly.substring(0,2)}';
  //   digitsOnly = digitsOnly.substring(2);
  //
  //   //Add the remaining digits with proper formatting
  //   final formattedNumber = StringBuffer();
  //   formattedNumber.write('($countryCode)');
  //
  //   int i = 0;
  //   while (i< digitsOnly.length){
  //     int groupLength = 2;
  //     if (i==0 && countryCode == '+1'){
  //       groupLength = 3;
  //     }
  //
  //     int end = i+groupLength;
  //     formattedNumber.write(digitsOnly.substring(i,end));
  //     if (end<digitsOnly.length){
  //       formattedNumber.write('');
  //     }
  //     i=end;
  //   }
  // }
}