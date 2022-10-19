class StringsUtils {
  StringsUtils._();

  static const String ddMmYy = 'dd-MM–yyyy';

  ///Validator
  static const String emailRegExp =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String plzEnterEmail = 'Please enter email';
  static const String enterValidEmail = 'Please enter valid email';
  static const String emptyQuote = '';
  static const String plzEnterPWD = 'Please enter Password';
  static const String pWDRegExp =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  static const String pWDMustBeUpperLower =
      'Password must be Uppercase,Lowercase,digit and specialCharacters';

  static const String appName = 'Luso American Financial';
  static const String getStarted = 'GET STARTED';
  static const String totalStops = 'Total Stops: ';
  static const String home = 'Home';
  static const String Home = 'HOME';
  static const String weight = 'Weight: ';
  static const String trailerType = 'Trailer Type: ';
  static const String calendar = 'Calendar\nof Events';
  static const String notifications = 'Notifications';
  static const String findAnAgent = 'Find an\nAgent';
  static const String findAnCouncil = 'Find an Council';
  static const String submitCouncilPhotos = 'Submit Council Photos';
  static const String contactUs = 'Contact Us';
  static const String ContactUs = 'CONTACT US';
  static const String search = 'Search';
  static const String council = 'Council / Lodge';
  static const String fullName = 'Full Name';
  static const String lastName = 'Last Name';
  static const String email = 'Email';
  static const String phone = 'Phone';
  static const String messages = 'Messages';
  static const String zipCode = 'Zip Code';
  static const String eventCalendar = 'Event Calendar';
  static const String splashScreenText = 'A FRATERNAL BENEFIT SOCIETY';
  static const String councilText =
      '"There are on agents locally within your Search area, Here is our list of Agents throughout the United States"';
  static const String eventCalendarDetail =
      'Calendar of Events for the Portuguese Fraternal Society groups: LALIS, PCU, SPRSI and LAEF meetings, functions, and other events ';
}
