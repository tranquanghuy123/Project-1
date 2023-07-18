import 'package:flutter/material.dart';
import 'package:project1/Home_Screen.dart';

import 'EditProfile_Screen.dart';

class ProfileScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

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
                     height: 25,
                     width: 171,
                     color: Colors.red,

                     child: Text('Link với tên sau khi ĐN'),
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
                 child: const Column(
                   children: [
                     SizedBox(height: 13),

                     ///Hồ sơ của tôi
                     ListTile(
                       dense: true,
                       leading: Icon(Icons.assignment, color: Colors.black, size: 30),
                       trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30),
                       title: Text("Hồ sơ của tôi", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500)),
                     ),

                     Divider(color: Colors.grey),

                     ListTile(
                       dense: true,
                       leading: Icon(Icons.assignment_late, color: Colors.black, size: 30),
                       trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30),
                       title: Text("Góp ý", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500)),
                     ),

                     Divider(color: Colors.grey),

                     ///Đăng xuất
                     ListTile(
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