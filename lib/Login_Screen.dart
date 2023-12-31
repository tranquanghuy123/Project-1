import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project1/DatabaseHelper.dart';
import 'package:project1/Home_Screen.dart';
import 'package:project1/Register_Screen.dart';
import 'package:project1/UserModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project1/DataGlobal.dart';
import 'package:project1/Google_Sign_in.dart';
import 'package:project1/User_Preferences.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


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

  ///Controller
  final _phonenumberController = TextEditingController();
  final _passwordController = TextEditingController();



  late DbHelper dbHelper;

  var user = UserModel();
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DbHelper();
  }

  Future<void> _handleLogin() async {
    String loginName = _phonenumberController.text;


    // Lưu thông tin đăng nhập vào Shared Preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', loginName);

    // Chuyển đến màn hình trang chủ
    Navigator.pushReplacementNamed(context, '/home');
  }


  @override
  void dispose() {
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
                              enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                               border: OutlineInputBorder(
                                   borderRadius: BorderRadius.all(Radius.circular(8))
                               ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.blue),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)))),
                              )
                        ),
                        const SizedBox(height: 43),
                        TextButton(
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                await dbHelper
                                    .getLoginUser(_phonenumberController.text)
                                    .then((value) {
                                      if(value != null){
                                        user = value;
                                        DataGlobal.userID = user.user_id;
                                        print('user: $user');
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => HomeScreen()));
                                      }else {
                                        print('Dang nhap that bai');
                                      }

                                });
                              }
                              //await UserPreferences.setLoginName(loginName);
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
                              'Đăng nhập',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            )),
                        const SizedBox(height: 20),

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
                            )),

                        SizedBox(height: 20),
                        ///Google
                        TextButton(
                            onPressed: () {
                              final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                              provider.googleLogin();
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


  // signInWithGoogle() async {
  //   GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //
  //   AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken
  //   );
  //
  //   UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
  //
  //   print(userCredential.user?.displayName);
  //
  //   if (userCredential.user != null)
  //   {
  //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
  //   }
  // }
}
