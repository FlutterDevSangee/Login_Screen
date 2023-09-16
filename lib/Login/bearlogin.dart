import 'package:bearlogin/Login/bear_controller.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final loginBearCntlr = Get.put(LoginBearController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: GetBuilder<LoginBearController>(builder: (_) {
          return Column(
            children: <Widget>[
              const SizedBox(
                height: 80,
              ),
              (MediaQuery.of(context).viewInsets.bottom == 0.0)
                  ? const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 45,
                        //  fontSize: Responsive.isMobile(context) ? 45 : 80,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        letterSpacing: 6,
                      ),
                    )
                  : const SizedBox(),
              (MediaQuery.of(context).viewInsets.bottom == 0.0)
                  ? Text(
                      'Enter your login Credentials',
                      style: TextStyle(
                          fontSize: 16,
                          // fontSize: Responsive.isMobile(context) ? 16 : 44,
                          color: Colors.grey.shade700),
                      textAlign: TextAlign.center,
                    )
                  : const Text(''),
              SizedBox(
                height: 300,
                width: 300,
                child: FlareActor(
                  'assets/images/Teddy.flr',
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.contain,
                  animation: loginBearCntlr.animationType,
                  callback: (animation) {
                    ///////
                    loginBearCntlr.animationType = 'idle';
                  },
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Colors.transparent,
                ),
                child: Form(
                  key: loginBearCntlr.formkey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        maxLength: 10,
                        focusNode: loginBearCntlr.usernameFocusNode,
                        // controller: txtcntrlr,
                        textCapitalization: TextCapitalization.none,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          counter: const Offstage(),
                          suffixIcon: (loginBearCntlr.iconCheckeduser)
                              ? null
                              : const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                          fillColor: const Color(0xffFBFBFB),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffE7E7E7)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffE7E7E7)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          prefixIcon: const Icon(
                            Icons.phone,
                            size: 22,
                          ),
                          hintText: "Mobile Number",
                        ),
                        onChanged: (String? value) {
                          if (value!.length == 10) {
                            loginBearCntlr.iconCheckeduser = true;
                          } else {
                            loginBearCntlr.iconCheckeduser = false;
                          }
                        },

                        validator: (String? value) {
                          if (value != null && value.length == 10) {
                            return null;
                          } else {
                            return '';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        maxLength: 6,
                        focusNode: loginBearCntlr.passwordFocusNode,
                        controller: loginBearCntlr.passwordController,
                        textCapitalization: TextCapitalization.none,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          counter: const Offstage(),
                          suffixIcon: (loginBearCntlr.iconCheckedpass)
                              ? null
                              : const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                          fillColor: const Color(0xffFBFBFB),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffE7E7E7)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffE7E7E7)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            size: 22,
                          ),
                          hintText: "Password",
                        ),
                        onChanged: (String? value) {
                          if (value!.length == 6) {
                            loginBearCntlr.iconCheckedpass = true;
                          } else {
                            loginBearCntlr.iconCheckedpass = false;
                          }
                        },
                        validator: (String? value) {
                          if (value != null && value.length == 6) {
                            return null;
                          } else {
                            return '';
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                  width: double.infinity,
                  height: 60,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff20667C),
                    // gradient: const LinearGradient(
                    //     begin: Alignment.topLeft,
                    //     end: Alignment.bottomRight,
                    //     colors: [
                    //       Color(0xff20667C),
                    //       Color(0xffB8CFD7),
                    //     ])
                  ),
                  child: Center(
                    child: Text("Login",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.raleway(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18))),
                  ),
                  // child:
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Colors.pink,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(30),
                  // ),
                  //   ),
                  //   onPressed: () {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) => Dashboard()));
                  //   },
                  //   child: const Text(
                  //     "Login",
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  // ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
