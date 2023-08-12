import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project1/DatabaseHelper.dart';
import 'package:project1/Google_Sign_in.dart';
import 'package:project1/Home_Screen.dart';
import 'package:project1/Login_Screen.dart';
import 'package:project1/UserModel.dart';
import 'package:provider/provider.dart';

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

  ///Controller
  final _usernameController = TextEditingController();
  final _identitynumberController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _passwordController = TextEditingController();

  /// show the password or not
  bool _isObscure = true;
  late DbHelper dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _identitynumberController.dispose();
    _phonenumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                          offset:
                              const Offset(0, 3), // changes position of shadow
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

                        ///Ho va ten
                        SizedBox(
                          height: 70,
                          width: widthScreen,
                          child: TextFormField(
                            controller: _usernameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập Họ và tên';
                              } else if (value.length < 4) {
                                return 'Họ và tên phải có ít nhất 4 kí tự';
                              } else if (!value.contains(' ') ||
                                  value.contains(RegExp(r'[0-9]'))) {
                                return 'Họ tên không hợp lệ. Xin vui lòng nhập lại';
                              } else {
                                return null;
                              }
                            },
                            style: const TextStyle(fontSize: 18),
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'Họ và tên',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(8))
                                ),
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

                        ///So CMND/CCCD
                        SizedBox(
                          height: 70,
                          width: widthScreen,
                          child: TextFormField(
                            controller: _identitynumberController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng số CMND/CCCD';
                              } else if (value.length < 12 &&
                                  value.length > 12) {
                                return 'Số CMND//CCCD không hợp lệ. Vui lòng nhập lại';
                              } else {
                                return null;
                              }
                            },
                            style: const TextStyle(fontSize: 18),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'Số CMND/CCCD',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(8))
                                ),
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

                        ///Số điện thoại
                        SizedBox(
                          height: 70,
                          width: widthScreen,
                          child: TextFormField(
                            controller: _phonenumberController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng số điện thoại';
                              } else if (value.length < 8 && value.length > 8) {
                                return 'Số điện thoại không hợp lệ. Vui lòng nhập lại';
                              } else {
                                return null;
                              }
                            },
                            style: const TextStyle(fontSize: 18),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'Số điện thoại',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(8))
                                ),
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

                        ///mật khẩu
                        SizedBox(
                          height: 70,
                          width: widthScreen,
                          child: TextFormField(
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng mật khẩu';
                              } else if (value.length < 8) {
                                return 'Mật khẩu phải có ít nhất 8 kí tự';
                              } else if (!value
                                  .contains(RegExp(r'[a-zA-z0-9]'))) {
                                return 'Mật khẩu phải có ít nhất 1 kí tự viết hoa và 1 chữ số';
                              } else {
                                return null;
                              }
                            },
                            obscureText: _isObscure,
                            style: const TextStyle(fontSize: 18),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: Icon(_isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    }),
                                contentPadding: const EdgeInsets.all(10),
                                hintText: 'mật khẩu',
                                hintStyle: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                                border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(8))
                                ),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.blue),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)))),
                          ),
                        ),

                        const SizedBox(height: 20),

                        TextButton(
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                _signup();
                              }
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                minimumSize: const Size(166, 52),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                )),
                            child: const Text(
                              'Đăng kí tài khoản',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            )),

                        SizedBox(height: 20),
                        ///Google
                        TextButton(
                            onPressed: () {
                              final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.deepOrange,
                                minimumSize: const Size(354, 52),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    side: BorderSide(
                                        width: 2, color: Colors.deepOrange))),
                            child: const Row(
                              children: [
                                Image(image: AssetImage('assets/icons/google.png')),
                                SizedBox(width: 101),
                                Text(
                                  'Google',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      fontFamily: 'Product Sans'),
                                )
                              ],
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

  Future<void> _signup() async {
    final user = UserModel(
        user_name: _usernameController.text,
        id_number: _identitynumberController.text,
        phone_number: _phonenumberController.text,
        password: _passwordController.text);
    try {
      await DbHelper.saveData(user);
      Navigator.pop(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } catch (e) {
      // Handle the error, e.g., show an error message
    }
  }

  // signInWithGoogle() async {
  //   GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //
  //   AuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken
  //   );
  //
  //   UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
  //
  //   print(userCredential.user?.displayName);
  //
  //   if (userCredential.user != null)
  //     {
  //       Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
  //     }
  // }
}
