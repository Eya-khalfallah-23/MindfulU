/// Custom exception class to handle various firebase authentication-related errors.
class MhFirebaseAuthException implements Exception {
  /// This error code associated with the exception
  final String code;

  /// Constructor that takes an error code
  MhFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The Email Address is already registered. Please enter a different Email.';
      case 'invalid-email':
        return 'The Email Address provided is invalid. Please enter a valid Email.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'user-disabled':
        return 'This user account has been disabled. Please contact support for assistance.';
      case 'user-not-found':
        return 'The Email Address is already registered. Please enter a different Email.';
      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code.';
      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later.';
      case 'email-already-exists':
        return 'The Email address already exists. Please use a different Email.';
      case 'provider-already-linked':
        return 'The account is already linked with another provide.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Please log in again';
      case 'credential-already-in-use':
        return 'This credential is already in associated with a different user account.';
      case 'user-mismatch':
        return 'The supplied credentials do not correspond to the previously signed in user.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email but different sign-in credentials.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Contact support for assistance';
      case 'expired-action-code':
        return 'The action code has expired. Please request a new action code';
      case 'invalid-action-code':
        return 'The action code is invalid. Please check the code and try again';
      case 'missing-action-code':
        return 'The action code is invalid. Please provide a valid action code';
      case 'user-token-expired':
        return 'The user\'s token has expired, and authentication is required. Please sign in again';
      case 'user-not-found':
        return 'No user was found for the given email or UID.';
      case 'invalid-credential':
        return 'The supplied credential is malformed or has expired.';
      case 'wrong-password':
        return 'The password is invalid. Please check your password and try again';
      case 'user-token-revoked':
        return 'The user\'s token has been revoked. Please sign in again';
      case 'invalid-message-payload':
        return 'The email template verification message payload is invalid.';
      case 'invalid-sender':
        return 'The email template sender is invalid. Please verify the sender\'s email';
      case 'invalid-recipient-email':
        return 'The account is already linked with another provide.';
      case 'provider-already-linked':
        return 'The account is already linked with another provide.';
      case 'provider-already-linked':
        return 'The account is already linked with another provide.';
      default:
        return 'An undefined error has occurred. Please try again';
    }
  }
}