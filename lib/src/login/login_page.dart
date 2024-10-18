import 'package:first_app/src/login/login.controller.dart';
import 'package:first_app/src/utils/my_colors.dart';
import 'package:first_app/src/utils/my_icons.dart';
import 'package:first_app/src/widget/animation_derilvery.dart';
import 'package:first_app/src/widget/container.dart';
import 'package:first_app/src/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _con = LoginController();
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance
        .addPostFrameCallback((timeStamp) => _con.init(context));
  }

  void _onLogin() {
    setState(() {
      _con.login();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerWidget(
          children: Container(
              padding: const EdgeInsets.all(0),
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    left: -100,
                    top: -70,
                    child: _circleLogin(),
                  ),
                  Positioned(
                    left: 20,
                    top: 70,
                    child: _circleText(),
                  ),
                  ListView(
                    children: [
                      _lottieAnimation(),
                      Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                            left: 40,
                            top: 0,
                            right: 40,
                            bottom: 0,
                          ),
                          child: Column(
                            children: [
                              _textFieldEmail(),
                              const SizedBox(height: 20),
                              _textFieldPassword(),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomButton(
                                text: 'เข้าสู่ระบบ',
                                onPressed: _con.isValid ? null : _onLogin,
                              ),
                            ],
                          )),
                      const SizedBox(height: 10),
                      _textAccount(),
                    ],
                  ),
                ],
              ))),
    );
  }

  Widget _textFieldEmail() {
    return TextField(
      onChanged: (value) => setState(() {
        _con.validationLogin();
      }),
      autofocus: true,
      controller: _con.emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'อีเมล',
          hintStyle: TextStyle(
            color: MyColors.secondaryColor,
          ),
          fillColor: MyColors.primaryInputColor,
          filled: true,
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: Icon(
            Icons.email,
            color: MyColors.primaryColor,
          )),
    );
  }

  Widget _textFieldPassword() {
    return TextField(
      onChanged: (value) => setState(() {
        _con.validationLogin();
      }),
      controller: _con.passwordController,
      decoration: InputDecoration(
          hintText: 'รหัสผู้ใช้งาน',
          hintStyle: TextStyle(color: MyColors.secondaryColor),
          fillColor: MyColors.primaryInputColor,
          filled: true,
          prefixIcon: Icon(
            Icons.key,
            color: MyColors.primaryColor,
          )),
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
    );
  }

  Widget _lottieAnimation() {
    return Container(
        padding: EdgeInsets.only(
            top: 200, bottom: MediaQuery.of(context).size.height * 0.05),
        child: AnimationLoading(
          iconRender: MyIcons.iconDelivery,
        ));
  }

  Widget _textAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'คุณยังไม่มีบัญชีใช้หรือไม่?',
          style: TextStyle(fontWeight: FontWeight.w100, color: Colors.blueGrey),
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            _con.goToRegisterPage();
          },
          child: Text(
            'สมัครสมาชิก',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: MyColors.primaryColor),
          ),
        )
      ],
    );
  }

  Widget _circleText() {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Text(
        'เข้าสู่ระบบ',
        style: TextStyle(
            color: MyColors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  Widget _circleLogin() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: MyColors.primaryColor),
      width: 240,
      height: 240,
    );
  }
}
