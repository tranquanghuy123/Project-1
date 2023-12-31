import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/DataGlobal.dart';
import 'package:project1/DatabaseHelper.dart';
import 'package:project1/Login_Screen.dart';
import 'package:project1/Profile_Screen.dart';
import 'UserModel.dart';
import 'package:project1/DataGlobal.dart';
import 'package:fluttertoast/fluttertoast.dart';

typedef FunctionCallback = void Function(String name);

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key,required this.name});

  final FunctionCallback name;

  @override
  State<StatefulWidget> createState() {
    return _editProfileScreenState();
  }
}

class _editProfileScreenState extends State<EditProfileScreen> {


  ///Global key
  final _formkey = GlobalKey<FormState>();

  ///Controller
  final _usernameController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _identitynumberController = TextEditingController();

  DbHelper? dbHelper;
  UserModel? user;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
    initData();

  }
  void initData() async{
    String tempUserID = '';
    if (DataGlobal.userID != null)
    {
      tempUserID = DataGlobal.userID!;
    }
    ///Gia tri cu~
    ///dbHelper.getUserById(DataGlobal.userID);

    ///Gia tri moi da gan vao bien temp
    //dbHelper.getUserById(tempUserID);
    user = await dbHelper?.getUserById(tempUserID);


    _usernameController.text = user?.user_name ?? '';
    _phonenumberController.text = user?.phone_number ?? '';
    _identitynumberController.text = user?.id_number ?? '';
}

  @override
  void dispose() {
    _usernameController.dispose();
    _identitynumberController.dispose();
    _phonenumberController.dispose();
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
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () async {
                              Navigator.pop(
                                  context,
                              true,
                              );
                            },
                            child: const Image(
                                image: AssetImage('assets/icons/arrow.png'))),
                        const SizedBox(width: 36),
                        const Text('Thông tin cá nhân',
                            style: TextStyle(color: Colors.white, fontSize: 21))
                      ],
                    ),
                  ),

                  ///form để chỉnh sửa thông tin xem SQLite SCRUD để sửa


                  Container(
                    height: heightScreen - 118.182,
                    width: widthScreen,
                    padding: const EdgeInsets.fromLTRB(15, 17, 15, 0),
                    child: Column(
                      children: [
                        const SizedBox(height: 38),
                        Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(100)),
                                border: Border.all(
                                    color: Colors.blueAccent, width: 5)),
                            child: const Image(
                                image: AssetImage('assets/icons/user.png'),
                                height: 117,
                                width: 117)),

                        const SizedBox(height: 38),


                        ///Ho va ten
                        SizedBox(
                          height: 70,
                          width: widthScreen,
                          child: TextFormField(
                            controller: _usernameController,
                            //readOnly: false,
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Vui lòng nhập Họ và tên';
                            //   } else if (value.length < 4) {
                            //     return 'Họ và tên phải có ít nhất 4 kí tự';
                            //   } else if (!value.contains(' ') ||
                            //       value.contains(RegExp(r'[0-9]'))) {
                            //     return 'Họ tên không hợp lệ. Xin vui lòng nhập lại';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            style: const TextStyle(fontSize: 18),
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
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
                            // readOnly: false,
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Vui lòng số điện thoại';
                            //   } else if (value.length < 8 && value.length > 8) {
                            //     return 'Số điện thoại không hợp lệ. Vui lòng nhập lại';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            style: const TextStyle(fontSize: 18),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
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
                            // readOnly: false,
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Vui lòng số CMND/CCCD';
                            //   } else if (value.length < 12 &&
                            //       value.length > 12) {
                            //     return 'Số CMND//CCCD không hợp lệ. Vui lòng nhập lại';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            style: const TextStyle(fontSize: 18),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                hintText: user?.id_number ?? '',
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

                        const SizedBox(height: 10),

                        const SizedBox(height: 35),

                        TextButton(
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                _update();
                                print('abc');
                                Fluttertoast.showToast(
                                    msg: "Cập nhật thành công",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.TOP,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                                // setState(() {
                                //  _update();
                                // });
                              }
                              //}
                              // else
                              //   {
                              //     Fluttertoast.showToast(
                              //         msg: "Cập nhật không thành công",
                              //         toastLength: Toast.LENGTH_SHORT,
                              //         gravity: ToastGravity.TOP,
                              //         timeInSecForIosWeb: 1,
                              //         backgroundColor: Colors.red,
                              //         textColor: Colors.white,
                              //         fontSize: 16.0
                              //     );
                              //   }
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
                              'Cập nhật',
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

  ///Update funtion
  Future<void> _update() async {
    String uname = _usernameController.text;
    String uPhoneNumber = _phonenumberController.text;
    String uIdNumber = _identitynumberController.text;
    String uid = DataGlobal.userID ?? '';
    print('abc');
    print(uname);


    if (_formkey.currentState!.validate()){
      _formkey.currentState!.save();
      UserModel user1 = UserModel(
        user_id: DataGlobal.userID,
          user_name: uname,
          phone_number: uPhoneNumber,
          id_number: uIdNumber);
      //await DbHelper.updateUser(user).then((value) => Navigator.of(context).pop());
      await DbHelper.updateUser(user1);
      widget.name(uname);
      print(user1.user_name);

    }
  }
}
