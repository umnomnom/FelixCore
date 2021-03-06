abstract class StringValidator {
  bool isValid(String value);
}

class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    if (value == null) {
      return false;
    }
    return value.isNotEmpty;
  }
}

class EmailAndPasswordValidators {
  final StringValidator nameValidator = NonEmptyStringValidator();
  final StringValidator emailValidator = NonEmptyStringValidator();
  final String invalidNameErrorText = 'Name can\'t be empty';
  final String invalidEmailErrorText = 'Email can\'t be empty';
}
