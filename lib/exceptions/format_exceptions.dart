/// Custom exception class to handle various format-related errors
class MhFormatException implements Exception {
  /// The associated error message
  final String message;

  /// Default constructor with a generic error message
  const MhFormatException(
      [this.message = 'An unexpected format error occurred. Please try again']);

  /// Create a format exception from a specific error message
  factory MhFormatException.fromMessage(String message) {
    return MhFormatException(message);
  }

  /// Get the corresponding error message
  String get formattedMessage => message;

  /// Create a format exception from a specific error code.
  factory MhFormatException.formCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const MhFormatException('The email address format is invalid. Please enter a valid email');
      case 'invalid-phone-number-format':
        return const MhFormatException('The provided phone number format is invalid. Please enter a valid number.');
      case 'invalid-date-format':
        return const MhFormatException('The date format is invalid. Please enter a valid date');
      case 'invalid-url-format':
        return const MhFormatException('The URL format is invalid. Please enter a valid URL');
      case 'invalid-credit-card-format':
        return const MhFormatException('The credit card format is invalid. Please enter a valid credit card number.');
      case 'invalid-numeric-format':
        return const MhFormatException('The input should be a valid numeric format.');
      default:
        return const MhFormatException('Invalid format. Please check and try again.');
    }
  }
}