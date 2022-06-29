import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_test/constants.dart';
import 'package:technology_test/features/home/presentation/pages/home.dart';
import 'package:technology_test/features/login/data/data_sources/api_services.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailId = TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');

  @override
  void dispose() {
    emailId.dispose();
    password.dispose();
    super.dispose();
  }

  _showDialog(context) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Error'),
              content: Text('Username or password wrong'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Close me!'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          cursorColor: kPrimaryColor,
          controller: emailId,
          onSaved: (email) {},
          decoration: const InputDecoration(
            hintText: "Your email",
            prefixIcon: Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Icon(Icons.person),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: TextFormField(
            textInputAction: TextInputAction.done,
            obscureText: true,
            cursorColor: kPrimaryColor,
            controller: password,
            decoration: const InputDecoration(
              hintText: "Your password",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.lock),
              ),
            ),
          ),
        ),
        const SizedBox(height: defaultPadding),
        ElevatedButton(
          onPressed: () async {
            Provider.of<ApiServices>(context, listen: false)
                .getUser(
                    email: emailId.text.toString(), password: password.text)
                .then((value) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Dashboard()));
            });
          },
          child: Text(
            "Login".toUpperCase(),
          ),
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }
}
