import 'package:flutter/material.dart';

import '../widget/button_auth.dart';
import '../widget/row_icon_social_media.dart';
import '../widget/text_field.dart';

class SignUp extends StatefulWidget {
  final Function()? onTap;
  const SignUp({super.key, this.onTap});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final passwordTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final confirmTextController = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  void displayMessage(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(message),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Form(
                key: formstate,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.menu_book_outlined,
                      size: 100,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text("M R I",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white)),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextForm(
                        hinttext: "الاسم و الكنية",
                        mycontroller: emailTextController,
                        validator: (text) {
                          if (text!.length < 3) {
                            return "لا يمكن ان يكون النص اقل من ثلاث احرف";
                          } else if (text.isEmpty) {
                            return "لا يمكن ترك الحقل فارغ";
                          } else if (text.length > 20) {
                            return "لا يمكن ان يكون اكثر من 20 حرف ";
                          }
                          return null;
                        },
                        obscureText: false),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextForm(
                        hinttext: "رقم الموبايل",
                        mycontroller: passwordTextController,
                        validator: (text) {
                          if (text!.length < 10) {
                            return "لا يمكن ان يكون الرقم اقل من 10 ارقام";
                          } else if (text.length > 10) {
                            return "لا يمكن ان يكون اكثر من 10 حرف ";
                          } else if (text.isEmpty) {
                            return "لا يمكن ترك الحقل فارغ";
                          }
                          return null;
                        },
                        obscureText: true),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextForm(
                        hinttext: "رمز الشراء",
                        mycontroller: confirmTextController,
                        validator: (text) {
                          if (text!.isEmpty) {
                            return "لا يمكن ترك الحقل فارغ";
                          }
                          return null;
                        },
                        obscureText: true),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButtonAuth(
                      title: "تسجيل دخول",
                      onPressed: () {
                        if (formstate.currentState!.validate()) {
                          i = 0;
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const HomePage(),
                          //     ));
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {}
                          //  Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => Login(),
                          //     )
                          //  )
                          ,
                          child: const Text(
                            "سجل الاّن",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "هل لديك حساب ؟",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: RowIconsSocialMedia(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

int i = 2;
