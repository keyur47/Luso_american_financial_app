
import 'package:luso_american_financial/utils/strings_utils.dart';

import 'exception/app_exception.dart';

class AppValidator {
  // static String? emailValidator(String? value) {
  //   const Pattern pattern = StringsUtils.emailRegExp;
  //   final RegExp regex = RegExp(pattern.toString());
  //   if (value!.isEmpty) {
  //     return StringsUtils.plzEnterEmail;
  //   } else if (!regex.hasMatch(value)) {
  //     return StringsUtils.enterValidEmail;
  //   } else {
  //     StringsUtils.emptyQuote;
  //   }
  //   return null;
  // }
  //
  // static String? passwordValidator(String? value) {
  //   if (value!.isEmpty) {
  //     return StringsUtils.plzEnterPWD;
  //   } else if (!(RegExp(StringsUtils.pWDRegExp).hasMatch(value.trim()))) {
  //     return StringsUtils.pWDMustBeUpperLower;
  //   } else {
  //     return null;
  //   }
  // }
  //
  // String? confirmPasswordValidator(String? value, {required String password}) {
  //   if (value!.isEmpty) {
  //     return StringsUtils.plzEnterPWD;
  //   } else if (!(RegExp(StringsUtils.pWDRegExp).hasMatch(value.trim()))) {
  //     return StringsUtils.pWDMustBeUpperLower;
  //   } else {
  //     return null;
  //   }
  // }

  static String? otpValidation(String? value) {
    if (value!.isEmpty) {
      return "Please fill 6 digit code";
    } else if (value.length != 6) {
      return "Please fill 6 digit code";
    } else {
      return null;
    }
  }

  static String? isValidMobile(String? value) {
    if (value!.isEmpty) {
      return "Please enter your mobile number";
    } else if ((value.length != 10 /*> 7 && value.length < 11*/)) {
      return "Invalid mobile number";
    }
    return null;
  }

  static String? emailValidator(String? value) {
    const Pattern pattern = StringsUtils.emailRegExp;
    final RegExp regex = RegExp(pattern.toString());
    if (value!.isEmpty) {
      return StringsUtils.plzEnterEmail;
    } else if (!regex.hasMatch(value)) {
      return StringsUtils.enterValidEmail;
    } else {
      StringsUtils.emptyQuote;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return StringsUtils.plzEnterPWD;
    } else if (!(RegExp(StringsUtils.pWDRegExp).hasMatch(value.trim()))) {
      return StringsUtils.pWDMustBeUpperLower;
    } else {
      return null;
    }
  }

  static String? isFirstNameValid(String? value) {
    if (value!.isEmpty) {
      return "Please enter first name";
    }
    return null;
  }

  static String? isLastNameValid(String? value) {
    if (value!.isEmpty) {
      return "Please enter last name";
    }
    return null;
  }

  static String? isMsgValid(String? value) {
    if (value!.isEmpty) {
      return "Please enter message";
    }
    return null;
  }

  static String? isPhotoSelectValid(String? value) {
    if (value!.isEmpty) {
      return "Please photo select";
    }
    return null;
  }


  static String? isUserNameValid(String? value) {
    if (value!.isEmpty) {
      return "Please enter user name";
    }
    return null;
  }

  static String? isCourseNameValid(String? value) {
    if (value!.isEmpty) {
      return "Please enter course name";
    }
    return null;
  }

  static String? isCourseLocationValid(String? value) {
    if (value!.isEmpty) {
      return "Please enter course location";
    }
    return null;
  }

  static String? playerNameValid(String? value) {
    if (value!.isEmpty) {
      return "Please enter player name";
    }
    return null;
  }

  static String? handicapValid(String? value) {
    if (value!.isEmpty) {
      return "Please enter Handicap index";
    }
    return null;
  }

  static String? isNumberOfMatchesValid(String? value) {
    if (value!.isEmpty) {
      return "Please enter number of matches played";
    }
    return null;
  }

  static String? teamNameValid(String? value) {
    if (value!.isEmpty) {
      return "Please enter team name";
    }
    return null;
  }

  static String? teamDescriptionValid(String? value) {
    if (value!.isEmpty) {
      return "Please enter Description";
    }
    return null;
  }

  static String? teamOwnerValid(String? value) {
    if (value!.isEmpty) {
      return "Please enter team owner";
    }
    return null;
  }

  static String? isTournamentNameValid(String? value) {
    if (value!.isEmpty) {
      return "Please enter tournament name";
    }
    return null;
  }

  static String? isTournamentPrizeValid(String? value) {
    if (value!.isEmpty) {
      return "Please enter tournament prize";
    }
    return null;
  }

  static String? isTournamentNumberOfRoundValid(String? value) {
    if (value!.isEmpty) {
      return "Please enter number of round";
    }
    return null;
  }

  static String? isMatchNumberValid(String? value) {
    if (value!.isEmpty) {
      return "Please enter number of match";
    }
    return null;
  }
}

//
// extension Validator on String {
//   bool isValidEmail() {
//     String pattern =
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//     RegExp regex = new RegExp(pattern);
//     if (this.isEmpty) {
//       showError("Please enter your email address");
//       return false;
//     } else if (!regex.hasMatch(this)) {
//       showError("Email address is invalid");
//       return false;
//     }
//     return true;
//   }
//
//   bool isValidPassword() {
//     // String pattern =
//     //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
//     // RegExp regex = new RegExp(pattern);
//     print(this.length);
//     if (this.isEmpty) {
//       showError("Please enter your password");
//       return false;
//     } else if (this.length < 6) {
//       showError("Password length must be at least 6 character long");
//       return false;
//     }
//     // else if (!regex.hasMatch(this)) {
//     //   showError("Password is invalid");
//     //   return false;
//     // }
//     return true;
//   }
//
//   bool isValidMobile() {
//     if (this.isEmpty) {
//       showError("Please enter your mobile number");
//       return false;
//     } else if (!(this.length > 7 && this.length < 11)) {
//       showError("Invalid mobile number");
//       return false;
//     }
//     return true;
//   }
// }

void showError(String message) {
  AppException(errorCode: 0, message: message).show();
}

// class ValidationUtils {
//   static String? validateMobile(String? value) {
//     String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
//     RegExp regExp = RegExp(pattern);
//     if (value != null) {
//       if (value.isEmpty) {
//       } else if (!regExp.hasMatch(value)) {
//         return '';
//       }
//     } else {
//       return null;
//     }
//     return null;
//   }
//
//   static String? validateEmail(String? value) {
//     String pattern = r'\S+@\S+\.\S+';
//     RegExp regExp = RegExp(pattern);
//     if (value != null) {
//       if (value.isEmpty) {
//         return 'Please enter Email Address';
//       } else if (!regExp.hasMatch(value)) {
//         return 'Please enter valid Email Address';
//       }
//     } else {
//       return null;
//     }
//     return null;
//   }
// }
