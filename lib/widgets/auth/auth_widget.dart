import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_placeholder_app/Theme/app_button_style.dart';
import 'package:json_placeholder_app/pages/pony_list_page.dart';
import 'package:json_placeholder_app/widgets/main_screen/main_screen_widget.dart';

class AuthWidget extends StatefulWidget {
  AuthWidget ({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Loging to your account'),
      ),
      body: ListView(
        children: [
          _HeaderWidget(),

          Column(
            children: <Widget>[
              for (int i = 1; i <= 2; i++)
                ListTile(
                  title: Text(
                    'Radio $i',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: /*i == 5 ? Colors.black38 : */ Colors.black),
                  ),
                  leading: Radio(
                    value: i,
                    groupValue: _value,
                    activeColor: Color(0xFF01B4E4),
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
    const textStyle = const TextStyle (
      fontSize: 15,
      color: Colors.black,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25,),
          _FormWidget(),
          SizedBox(height: 25,),
          Text('In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple. Click here to get started.',
            style: textStyle,
            ),
          SizedBox(height: 5,),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: (){},
            child: Text('Register'),),
          SizedBox(height: 25,),
          Text("If you signed up but didn't get your verification email, click here to have it resent.",
            style: textStyle,
            ),
          SizedBox(height: 5,),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: (){},
            child: Text('Verify email'),),
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
  String? errorText = null;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin'){
      errorText = null;

      final navigator = Navigator.of(context);
      // navigator.push(
      //   // MaterialPageRoute <void> (builder: (context) => MainScreenWidget()),
      //   // MaterialPageRoute <void> (builder: (context) => PonyListPage()),
      // );
      navigator.pushReplacementNamed('/main');
      print('open app');


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
    const textStyle = const TextStyle (
      fontSize: 15,
      color: Color(0xFF212529),
    );
    final color = const Color(0xFF01B4E4);
    final textFieldDecorator = const InputDecoration(
      // border: OutlineInputBorder(),
      isCollapsed: true,
      contentPadding: EdgeInsets.symmetric(vertical:10, horizontal: 10),
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFced4da), width: 1),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF01B4E4), width: 1),
      ),
    );

    final errorText = this.errorText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(errorText,
            style: TextStyle(
            color: Colors.red,
            fontSize: 17 ),
          ),
          SizedBox(height: 20,)],
        // else ...[PonyListPage()],

        Text('Username',
        style : textStyle),
        SizedBox(height: 5,),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecorator,
        ),
        SizedBox(height: 20,),
        Text('Password',
            style : textStyle),
        SizedBox(height: 5,),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecorator,
          obscureText: true,
        ),
        SizedBox(height: 30,),
        Row(children: [
          // TextButton(
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              textStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
              ),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 15, vertical: 10)
              ),
            ),
            //   TextButton.styleFrom(
            //   primary: Colors.pink,
            //   backgroundColor: Color(0xFF01B4E4),
            // ),

            onPressed: _auth,
            child: Text('Login',
              // style : textStyle),
            ),
          ),
          SizedBox(width: 25,),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: _resetPassword,
            child: Text('Reset password',
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
