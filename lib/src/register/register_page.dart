import 'package:first_app/src/register/register.controller.dart';
import 'package:first_app/src/utils/my_colors.dart';
import 'package:first_app/src/utils/my_icons.dart';
import 'package:first_app/src/widget/animation_derilvery.dart';
import 'package:first_app/src/widget/container.dart';
import 'package:first_app/src/widget/custom_button.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final RegisterController _con = RegisterController();
  @override
  void initState() {
    super.initState();
    _con.init(context);
  }

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: ContainerWidget(
  //       children: Container(
  //         padding: const EdgeInsets.all(0),
  //         width: double.infinity,
  //         height: double.infinity,
  //         child: Stack(
  //           children: [
  //             Positioned(
  //               left: -100,
  //               top: -70,
  //               child: _circleRegister(),
  //             ),
  //             Positioned(
  //               left: -5,
  //               top: 70,
  //               child: _circleText(),
  //             ),
  //             Column(
  //               children: [
  //                 _lottieAnimation(),
  //                 SingleChildScrollView(
  //                   child: Container(
  //                     width: double.infinity,
  //                     margin: const EdgeInsets.only(
  //                       left: 40,
  //                       top: 0,
  //                       right: 40,
  //                       bottom: 0,
  //                     ),
  //                     child: Column(
  //                       children: [
  //                         _textFieldEmail(),
  //                         const SizedBox(height: 10),
  //                         _textFieldName(),
  //                         const SizedBox(height: 10),
  //                         _textFieldLastName(),
  //                         const SizedBox(height: 10),
  //                         _textFieldPhoneNumber(),
  //                         const SizedBox(height: 10),
  //                         _textFieldPassword(),
  //                         const SizedBox(height: 10),
  //                         _textFieldCFPassword(),
  //                         const SizedBox(
  //                           height: 20,
  //                         ),
  //                         CustomButton(
  //                           text: 'สมัครสมาชิก',
  //                           onPressed: () {},
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return ContainerWidget(
        children: Scaffold(
      body: Stack(
        children: [
          // This is your scrollable content
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Column(
                children: [
                  _lottieAnimation(),
                  const SizedBox(height: 20), // Add spacing before text fields
                  _textFieldEmail(),
                  const SizedBox(height: 10),
                  _textFieldName(),
                  const SizedBox(height: 10),
                  _textFieldLastName(),
                  const SizedBox(height: 10),
                  _textFieldPhoneNumber(),
                  const SizedBox(height: 10),
                  _textFieldPassword(),
                  const SizedBox(height: 10),
                  _textFieldCFPassword(),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: 'สมัครสมาชิก',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          // Positioned widgets for non-scrollable content
          Positioned(
            left: -100,
            top: -70,
            child: _circleRegister(),
          ),
          Positioned(
            left: -5,
            top: 70,
            child: _circleText(),
          ),
        ],
      ),
    ));
  }

  Widget _circleRegister() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: MyColors.primaryColor),
      width: 240,
      height: 240,
    );
  }

  Widget _circleText() {
    return Container(
        padding: const EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  _con.goBack();
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 12, right: 0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Colors.white,
                  ),
                )),
            Text(
              'สมัครสมาชิก',
              style: TextStyle(
                  color: MyColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ));
  }

  Widget _lottieAnimation() {
    return Container(
        padding: EdgeInsets.only(
            top: 120, bottom: MediaQuery.of(context).size.height * 0.05),
        child: AnimationLoading(
          iconRender: MyIcons.iconRegister,
          height: 250,
          width: 250,
        ));
  }

  Widget _textFieldEmail() {
    return TextField(
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

  Widget _textFieldName() {
    return TextField(
      decoration: InputDecoration(
          hintText: 'ชื่อ',
          hintStyle: TextStyle(color: MyColors.secondaryColor),
          fillColor: MyColors.primaryInputColor,
          filled: true,
          prefixIcon: Icon(
            Icons.person,
            color: MyColors.primaryColor,
          )),
    );
  }

  Widget _textFieldLastName() {
    return TextField(
      decoration: InputDecoration(
          hintText: 'นามสกุล',
          hintStyle: TextStyle(
            color: MyColors.secondaryColor,
          ),
          fillColor: MyColors.primaryInputColor,
          filled: true,
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: Icon(
            Icons.person_2_outlined,
            color: MyColors.primaryColor,
          )),
    );
  }

  Widget _textFieldPhoneNumber() {
    return TextField(
      decoration: InputDecoration(
          hintText: 'เบอร์โทร',
          hintStyle: TextStyle(color: MyColors.secondaryColor),
          fillColor: MyColors.primaryInputColor,
          filled: true,
          prefixIcon: Icon(
            Icons.phone,
            color: MyColors.primaryColor,
          )),
    );
  }

  Widget _textFieldPassword() {
    return TextField(
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

  Widget _textFieldCFPassword() {
    return TextField(
      decoration: InputDecoration(
          hintText: 'ยืนยันรหัสผู้ใช้งาน',
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
}
