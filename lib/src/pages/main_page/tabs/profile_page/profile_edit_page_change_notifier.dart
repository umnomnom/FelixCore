import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:felix_core/src/pages/main_page/tabs/profile_page/profile_edit_page_model.dart';
import 'package:felix_core/src/common_widgets/form_submit_button.dart';
import 'package:felix_core/src/common_widgets/platform_exception_alert_dialog.dart';
import 'package:felix_core/src/services/auth.dart';

class ProfileEditPageChangeNotifier extends StatefulWidget {
  ProfileEditPageChangeNotifier({@required this.model});
  final ProfileEditPageChangeModel model;

  static Widget create(BuildContext context) {
    final AuthBase auth = Provider.of<AuthBase>(context);
    return ChangeNotifierProvider<ProfileEditPageChangeModel>(
      builder: (context) => ProfileEditPageChangeModel(auth: auth),
      child: Consumer<ProfileEditPageChangeModel>(
        builder: (context, model, _) =>
            ProfileEditPageChangeNotifier(model: model),
      ),
    );
  }

  @override
  _ProfileEditFormChangeNotifierState createState() =>
      _ProfileEditFormChangeNotifierState();
}

class _ProfileEditFormChangeNotifierState
    extends State<ProfileEditPageChangeNotifier> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _bioController = TextEditingController();

  final TextEditingController _teamsController = TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();

  final FocusNode _emailFocusNode = FocusNode();

  final FocusNode _bioFocusNode = FocusNode();

  String get _name => _nameController.text;
  String get _email => _emailController.text;
  String get _bio => _bioController.text;

  ProfileEditPageChangeModel get model => widget.model;

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    try {
      //await model.submit(context, _name, _email, _bio);
      Navigator.of(context).pop();
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: 'Update Profile Failed',
        exception: e,
      ).show(context);
    }
  }

  void _nameEditingComplete() {
    final newFocus = model.nameValidator.isValid(model.name)
        ? _nameFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _emailEditingComplete() {
    final newFocus = model.nameValidator.isValid(model.name)
        ? _emailFocusNode
        : _bioFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _bioEditingComplete() {}

  List<Widget> _buildChildren() {
    return [
      _buildNameTextField(),
      SizedBox(height: 8.0),
      _buildEmailTextField(),
      SizedBox(height: 8.0),
      _buildBioTextField(),
      SizedBox(height: 8.0),
      FormSubmitButton(
        text: model.primaryButtonText,
        onPressed: model.canSubmit ? _submit : null,
      ),
    ];
  }

  TextField _buildNameTextField() {
    return TextField(
      controller: _nameController,
      focusNode: _nameFocusNode,
      decoration: InputDecoration(
        labelText: 'Name',
        hintText: 'First Last',
        errorText: model.nameErrorText,
        enabled: model.isLoading == false,
      ),
      autocorrect: false,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      onChanged: model.updateName,
      onEditingComplete: () => _nameEditingComplete(),
    );
  }

  TextField _buildEmailTextField() {
    return TextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'test@test.com',
        errorText: model.nameErrorText,
        enabled: model.isLoading == false,
      ),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: model.updateName,
      onEditingComplete: () => _emailEditingComplete(),
    );
  }

  TextField _buildBioTextField() {
    return TextField(
      controller: _bioController,
      focusNode: _bioFocusNode,
      decoration: InputDecoration(
        labelText: 'Bio',
        hintText: 'Describe Yourself',
        errorText: model.nameErrorText,
        enabled: model.isLoading == false,
      ),
      autocorrect: false,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      onChanged: model.updateName,
      onEditingComplete: () => _bioEditingComplete(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }
}
