import 'package:flutter/material.dart';
import 'package:project1/Register_Screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _loginScreenState();
  }
}

class _loginScreenState extends State<LoginScreen> {
  ///Global key
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: widthScreen,
          height: heightScreen,
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  ///Appbar
                  Container(
                    width: widthScreen,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: 4,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(15),
                    child: const Row(
                      children: [
                        SizedBox(width: 16),
                        Text('Đăng nhập',
                            style: TextStyle(color: Colors.white, fontSize: 21))
                      ],
                    ),
                  ),

                  ///form đăng kí
                  Container(
                    height: heightScreen - 118.182,
                    width: widthScreen,
                    padding: const EdgeInsets.fromLTRB(15, 17, 15, 0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 48,
                          width: widthScreen,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'Vui lòng sử dụng số điện thoại đã đăng ký với ',
                                  style: TextStyle(
                                      color: Colors.orange, fontSize: 17)),
                              Text('ứng dụng Quận 10 Trực Tuyến',
                                  style: TextStyle(
                                      color: Colors.orange, fontSize: 17)),
                            ],
                          ),
                        ),

                        const SizedBox(height: 10),

                        ///Số điện thoại
                        SizedBox(
                          height: 52,
                          width: widthScreen,
                          child: TextFormField(
                            style: const TextStyle(fontSize: 18),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'Số điện thoại',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.blue),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)))),
                          ),
                        ),

                        SizedBox(height: 43),

                        TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                minimumSize: Size(166, 52),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                )),
                            child: const Text(
                              'Đăng nhập',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            )),
                        SizedBox(height: 20),

                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Ông/Bà chưa có tài khoản?  ',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                Text(
                                  'Đăng kí',
                                  style: TextStyle(
                                      color: Colors.blueAccent, fontSize: 18),
                                ),
                              ],
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
