import 'package:flutter/material.dart';
import 'package:project1/Login_Screen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _registerScreenState();
  }
}

class _registerScreenState extends State<RegisterScreen> {
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
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: const Image(
                                image: AssetImage('assets/icons/arrow.png'))),
                        const SizedBox(width: 36),
                        const Text('Đăng kí tài khoản',
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
                        Container(
                          height: 24,
                          width: widthScreen,
                          child: const Text(
                              'Vui lòng sử dụng với thông tin thật để đăng ký',
                              style: TextStyle(
                                  color: Colors.orange, fontSize: 17)),
                        ),

                        const SizedBox(height: 10),

                        ///Ho va ten
                        SizedBox(
                          height: 52,
                          width: widthScreen,
                          child: TextFormField(
                            style: const TextStyle(fontSize: 18),
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'Họ và tên',
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

                        SizedBox(height: 10),

                        ///So CMND/CCCD
                        SizedBox(
                          height: 52,
                          width: widthScreen,
                          child: TextFormField(
                            style: const TextStyle(fontSize: 18),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'Số CMND/CCCD',
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

                        SizedBox(height: 10),

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

                        SizedBox(height: 10),

                        ///mật khẩu
                        SizedBox(
                          height: 52,
                          width: widthScreen,
                          child: TextFormField(
                            style: const TextStyle(fontSize: 18),
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'mật khẩu',
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

                        SizedBox(height: 20),

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
                              'Đăng kí tài khoản',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            )),
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
