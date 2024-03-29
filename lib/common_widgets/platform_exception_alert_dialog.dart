import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:my_e_service_company/common_widgets/platform_alert_dialog.dart';

class FirebaseAuthExceptionAlertDialog extends PlatformAlertDialog {
  FirebaseAuthExceptionAlertDialog({
    @required String title,
    @required FirebaseAuthException exception,
  }) : super(
            title: title,
            content: _message(exception),
            defaultActionText: 'OK');

  static String _message(FirebaseAuthException exception) {
    return _errors[exception.code] ?? exception.message;
  }

  static Map<String, String> _errors = {
    "ERROR_WEAK_PASSWORD" : "If the password is not strong enough.",
    "ERROR_INVALID_CREDENTIAL": "If the email address is malformed.",
    "ERROR_EMAIL_ALREADY_IN_USE":
        "If the email is already in use by a different account.",
    'ERROR_INVALID_EMAIL': "If the email address is malformed.",
    'ERROR_WRONG_PASSWORD': 'The password is invalid',
    "ERROR_USER_NOT_FOUND":
        'If there is no user corresponding to the given [email] address, or if the user has been deleted.',
    'ERROR_USER_DISABLED': 'If the user has been disabled',
    'ERROR_TOO_MANY_REQUESTS':
        'If there was too many attempts to sign in as this user.',
    'ERROR_OPERATION_NOT_ALLOWED':
        'Indicates that Email & Password accounts are not enabled.',
    "invalid-email" : "The email address is not valid.",
    'user-disabled' :
        'The user corresponding to the given email has been disabled.',
    'user-not-found' :
        'There is no user corresponding to the given email.',
    "wrong-password" :
        "The password is invalid for the given email, or the account corresponding to the email does not have a password set."
  };
}
