import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/Google_Sign_in.dart';
import 'package:project1/Home_Screen.dart';
import 'package:project1/Login_Screen.dart';
import 'package:provider/provider.dart';
import 'DataGlobal.dart';
import 'DatabaseHelper.dart';
import 'EditProfile_Screen.dart';
import 'UserModel.dart';

class ProfileScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreenState();
  }
}

  class _ProfileScreenState extends State<ProfileScreen>{

    late DbHelper dbHelper;

    UserModel? user;

    @override
    void initState() {
      super.initState();
      dbHelper = DbHelper();
      initData();

    }
    void initData() async{
      String tempUserID = '0';
      if (DataGlobal.userID != null)
      {
        tempUserID = DataGlobal.userID!;
      }

      ///Gia tri cu~
      ///dbHelper.getUserById(DataGlobal.userID);

      ///Gia tri moi da gan vao bien temp
      dbHelper.getUserById(tempUserID);
      user = await dbHelper.getUserById(tempUserID);
    }
    @override
    Widget build(BuildContext context) {
      double widthScreen = MediaQuery.of(context).size.width;
      double heightScreen = MediaQuery.of(context).size.height;

      final googleUser = FirebaseAuth.instance.currentUser!;

      return SafeArea(child: Scaffold(
        body: Container(
          width: widthScreen,
          height: heightScreen,
          color: Colors.blue,
          child: Stack(
            children: [

              ///Ô 1
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 190,
                  width: widthScreen,
                  //color: Colors.green,
                  padding: EdgeInsets.fromLTRB(16, 14, 16, 10),
                  child: Column(
                    children: [
                      Container(
                        width: widthScreen,
                        height: 35,
                        //color: Colors.orange,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()));
                                },
                                child: const Image(
                                  image: AssetImage('assets/icons/arrow.png'), height: 30,width: 30,)),
                            GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditProfileScreen()));
                                },
                                child: Icon(Icons.edit, size: 30,color: Colors.white,))
                          ],
                        ),
                      ),

                      Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              border: Border.all(color: Colors.white, width: 3)
                          ),

                          child: const Image(image: AssetImage('assets/icons/user.png'),height: 117,
                              width: 117)
                      ),
                      SizedBox(height: 10),

                      Container(
                        alignment: Alignment.center,
                        height: 25,
                        width: 171,
                        //color: Colors.red,
                        child: Text(user?.user_name ?? googleUser.email!, style: TextStyle( fontSize: 18, color: Colors.white),),
                      )

                    ],
                  ),
                ),
              ),

              ///Ô 2
              Positioned(
                  left: 0,
                  top: 190,
                  child: Container(
                      width: widthScreen,
                      height: heightScreen - 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child:Column(
                        children: [
                          SizedBox(height: 13),

                          ///Hồ sơ của tôi
                          const ListTile(
                            dense: true,
                            leading: Icon(Icons.assignment, color: Colors.black, size: 30),
                            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30),
                            title: Text("Hồ sơ của tôi", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500)),
                          ),

                          Divider(color: Colors.grey),

                          const ListTile(
                            dense: true,
                            leading: Icon(Icons.assignment_late, color: Colors.black, size: 30),
                            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30),
                            title: Text("Góp ý", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500)),
                          ),

                          Divider(color: Colors.grey),

                          ///Đăng xuất
                          ListTile(
                            onTap: (){
                              final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                              provider.logout();
                            },
                            dense: true,
                            leading: Icon(Icons.input, color: Colors.black, size: 30),
                            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30),
                            title: Text("Đăng xuất", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500)),
                          ),


                        ],
                      )
                  )
              )
            ],
          ),
        ),
      )
      );
    }

  }

