import 'package:flutter/material.dart';

import '../../Theme/app_button_style.dart';
import '../../Theme/app_colors.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget ({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    String lString;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Loging to your account'),
      ),
      body: ListView(
        children: [
          const _HeaderWidget(),
          Column(
            children: <Widget>[
              for (int i = 1; i <= 2; i++)
                ListTile(
                  title: Text(
                    lString  = (i==1) ? 'En' : 'Ru',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: /*i == 5 ? Colors.black38 : */ Colors.black),
                  ),
                  leading: Radio(
                    value: i,
                    groupValue: _value,
                    activeColor: AppColors.mainLightGreen,
                    onChanged: (int? value) {
                    // i == 6 ? null : (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}



class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);
  final color = const Color(0xFF01B4E4);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle (
      fontSize: 15,
      color: Colors.black,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25,),
          const _FormWidget(),
          const SizedBox(height: 25,),
          const Text('In order to use the editing and rating capabilities of Week Menu, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple. Click here to get started.',
            style: textStyle,
            ),
          const SizedBox(height: 5,),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: (){},
            child: const Text('Register'),),
          const SizedBox(height: 25,),
          const Text("If you signed up but didn't get your verification email, click here to have it resent.",
            style: textStyle,
            ),
          const SizedBox(height: 5,),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: (){},
            child: const Text('Verify email'),),
          ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}


class _FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  String? errorText;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin'){
      errorText = null;

      final navigator = Navigator.of(context);
      navigator.pushReplacementNamed('/main');
      // print('open app');
    }
    else {
      errorText = 'Wrong login or password!';
      print(errorText);
    }
    setState(() {

    });
  }
  void _resetPassword() {
    print('resetPassword');
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle (
      fontSize: 15,
      color: Color(0xFF212529),
    );
    const textFieldDecorator = InputDecoration(
      // border: OutlineInputBorder(),
      isCollapsed: true,
      contentPadding: EdgeInsets.symmetric(vertical:10, horizontal: 10),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFced4da), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.mainLightGreen, width: 1),
      ),
    );

    final errorText = this.errorText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(errorText,
            style: const TextStyle(
            color: Colors.red,
            fontSize: 17 ),
          ),
          const SizedBox(height: 20,)],
        // else ...[PonyListPage()],

        const Text('Username',
        style : textStyle),
        const SizedBox(height: 5,),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecorator,
        ),
        const SizedBox(height: 20,),
        const Text('Password',
            style : textStyle),
        const SizedBox(height: 5,),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecorator,
          obscureText: true,
        ),
        const SizedBox(height: 30,),
        Row(children: [
          // TextButton(
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.mainLightGreen),
              foregroundColor: MaterialStateProperty.all(AppColors.foregroundLightGreen),
              textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
              ),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10)
              ),
            ),
            //   TextButton.styleFrom(
            //   primary: Colors.pink,
            //   backgroundColor: Color(0xFF01B4E4),
            // ),

            onPressed: _auth,
            child: const Text('Login',
              // style : textStyle),
            ),
          ),
          const SizedBox(width: 25,),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: _resetPassword,
            child: const Text('Reset password',
              style : TextStyle(
                // color: color,
                ),
              ),
          ),

        ],)
      ],
    );
  }
}
