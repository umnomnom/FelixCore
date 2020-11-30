import 'package:felix_core/src/models/profile.dart';
import 'package:felix_core/src/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:felix_core/src/pages/main_page/tabs/profile_page/validators.dart';
import 'package:felix_core/src/services/auth.dart';
import 'package:provider/provider.dart';

class ProfileEditPageChangeModel
    with EmailAndPasswordValidators, ChangeNotifier {
  ProfileEditPageChangeModel({
    @required this.auth,
    this.name = '',
    // this.email = '',
    // this.password = '',
    // this.formType = EmailSignInFormType.signIn,
    this.isLoading = false,
    this.submitted = false,
  });
  final AuthBase auth;
  String name;
  // String email;
  // String password;
  // EmailSignInFormType formType;
  bool isLoading;
  bool submitted;

  Future<void> submit(
      BuildContext context, String name, String email, String bio) async {
    updateWith(submitted: true, isLoading: true);
    try {
      Profile sampleProfile = Profile(name: name, email: email, bio: bio);
      final database = Provider.of<Database>(context);
      await database.updateProfile(sampleProfile);
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }

  String get primaryButtonText {
    return 'Update Profile';
  }

  bool get canSubmit {
    return nameValidator.isValid(name) &&
        //emailValidator.isValid(email) &&
        !isLoading;
  }

  // String get passwordErrorText {
  //   bool showErrorText = submitted && !passwordValidator.isValid(password);
  //   return showErrorText ? invalidPasswordErrorText : null;
  // }

  String get nameErrorText {
    bool showErrorText = submitted && !nameValidator.isValid(name);
    return showErrorText ? invalidNameErrorText : null;
  }

  void updateName(String name) => updateWith(name: name);

  //void updatePassword(String password) => updateWith(password: password);

  void updateWith({
    String name,
    //String password,
    bool isLoading,
    bool submitted,
  }) {
    this.name = name ?? this.name;
    this.isLoading = isLoading ?? this.isLoading;
    this.submitted = submitted ?? this.submitted;
    notifyListeners();
  }
}
