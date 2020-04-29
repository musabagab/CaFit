import 'package:flutter/material.dart';
import 'package:provider_architecture/core/enums/view_state.dart';
import 'package:provider_architecture/core/viewmodels/login_model.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import '../shared/app_colors.dart';
import '../widgets/login_header.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginHeader(
              controller: _controller,
              validationMessage: model.errorMessage,
            ),
            model.state == ViewState.Busy
                ? CircularProgressIndicator()
                : FlatButton(
                    color: Colors.white,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      var loginsuccess = await model.login(_controller.text);
                      if (loginsuccess) {
                        Navigator.pushNamed(context, '/');
                      }
                    },
                  )
          ],
        ),
      ),
    );
  }
}
