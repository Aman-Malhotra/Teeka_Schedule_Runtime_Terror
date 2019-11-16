import 'package:flutter/material.dart';
import 'package:teeka/Parents/registration.dart';
import 'package:teeka/Widgets/styles.dart';
import 'package:teeka/Widgets/widgets.dart';
import 'package:teeka/Widgets/title.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController, passController;

  @override
  void initState() {
    super.initState();
    emailController = new TextEditingController();
    passController = new TextEditingController();
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return "Enter a valid email";
    } else {
      return null;
    }
  }

  loginClick() {
    Navigator.push(
      context,
      MaterialPageRoute(
        // builder: (context) => Dashboard(),
        fullscreenDialog: true,
      ),
    );
  }

  signupClick() {}

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          // Image.asset(
          //   'assets/logo.png',
          //   alignment: Alignment.center,
          //   height: MediaQuery.of(context).size.height * 0.1,
          // ),
          ListTile(
            dense: true,
            title: title(context: context, text: "Login"),
          ),
          padding(
            formFields(
              context: context,
              hintText: "Email",
              controller: emailController,
              validator: validateEmail,
            ),
          ),
          padding(
            formFields(
                context: context,
                controller: passController,
                hintText: "Password",
                validator: validateEmail,
                obscureText: true),
          ),
          padding(
            button(
              context: context,
              function: loginClick,
              text: "Login",
            ),
          ),
          padding(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Not registered yet ?"),
                InkWell(
                  child: subTitle(
                    context: context,
                    text: "Sign Up",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Registration(),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
