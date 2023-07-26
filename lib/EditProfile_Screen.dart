import 'package:flutter/material.dart';
import 'package:project1/DatabaseHelper.dart';
import 'package:project1/Login_Screen.dart';
import 'package:project1/Profile_Screen.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});

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

  late DbHelper dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
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
                            onTap: () {
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileScreen()));
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

                        const SizedBox(height: 10),

                        ///Ho va ten
                        SizedBox(
                          height: 52,
                          width: widthScreen,
                          child: TextFormField(
                            style: const TextStyle(fontSize: 18),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                hintText: user?.user_name ?? 'Ho va ten',
                                hintStyle: const TextStyle(
                                    color: Colors.black, fontSize: 18),
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

                        ///Số điện thoại
                        SizedBox(
                          height: 52,
                          width: widthScreen,
                          child: TextFormField(
                            style: const TextStyle(fontSize: 18),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                hintText: user?.phone_number ?? 'So dien thoai',
                                hintStyle: const TextStyle(
                                    color: Colors.black, fontSize: 18),
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

                        ///So CMND/CCCD
                        SizedBox(
                          height: 52,
                          width: widthScreen,
                          child: TextFormField(
                            style: const TextStyle(fontSize: 18),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                hintText: user?.id_number ?? 'CMND/CCCD',
                                hintStyle: const TextStyle(
                                    color: Colors.black, fontSize: 18),
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
}
