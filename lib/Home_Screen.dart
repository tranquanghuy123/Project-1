import 'package:flutter/material.dart';
import 'package:project1/Profile_Screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: widthScreen,
          height: heightScreen,
          color: Colors.lightBlue,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ///Appbar
                Container(
                  height: 80,
                  width: widthScreen,
                  //color: Colors.lightBlue,
                  padding: EdgeInsets.fromLTRB(6, 0, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 70,
                        width: 222,
                        //color: Colors.orange,
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'QUẬN 10 TRỰC TUYẾN',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              'Xin chào, Ông/Bà',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 100),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 20),
                        height: 100,
                        width: 61,
                        //color: Colors.orange,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfileScreen()));
                              },
                              child: Image(
                                  image: AssetImage('assets/icons/profile1.png')),
                            ),
                            SizedBox(width: 11),
                            Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 26,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                ///Ô 2
                Container(
                  width: widthScreen,
                  height: heightScreen,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///Tra cứu hồ sơ
                        Container(
                          padding: EdgeInsets.only(left: 10, top: 4),
                          height: 28,
                          width: 150,
                          //color: Colors.green,
                          child: const Text(
                            'Tra cứu hồ sơ',
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                        ),

                        ///Ông/Bà vui lòng nhập hoặc quét mã số biên nhận để tra cứu
                        Container(
                          width: widthScreen,
                          height: 240,
                          //color: Colors.green,
                          padding: EdgeInsets.only(left: 17, top: 5, right: 16),
                          child: Column(
                            children: [
                              ///Ông bà vui lòng.....
                              SizedBox(
                                  width: widthScreen,
                                  height: 40,
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ông/Bà vui lòng nhập hoặc quét mã số biên nhận để',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      Text(
                                        'nhận tra cứu',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ],
                                  )),

                              SizedBox(height: 6),

                              ///Qr
                              Container(
                                height: 40,
                                width: widthScreen,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    border: Border.all(color: Colors.blue)),
                                padding: const EdgeInsets.only(left: 4),
                                child: const Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: Image(
                                          image: AssetImage(
                                              'assets/icons/qr-code.png')),
                                    ),
                                    SizedBox(width: 17),
                                    Text(
                                      'Mã số biên nhận của Ông/Bà',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 14),

                              ///Home1,2,3
                              SizedBox(
                                height: 132,
                                width: widthScreen,
                                //color: Colors.red,
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            'assets/images/home1.png')),
                                    Image(
                                        image: AssetImage(
                                            'assets/images/home2.png')),
                                    Image(
                                        image: AssetImage(
                                            'assets/images/home3.png'))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 10),

                        ///Thông tin truyên truyền, cổ đông
                        Container(
                          padding: const EdgeInsets.only(left: 10, top: 4),
                          height: 32,
                          width: widthScreen,
                          //color: Colors.green,
                          child: const Text(
                            'Thông tin truyên truyền, cổ đông',
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                        ),

                        ///home4
                        Container(
                          height: 90,
                          width: widthScreen,
                          margin: EdgeInsets.only(right: 6),
                          padding: EdgeInsets.fromLTRB(8, 10, 12, 10),
                          //color: Colors.grey,
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                  image: AssetImage('assets/images/home4.png')),
                              SizedBox(width: 10),
                              SizedBox(
                                width: 275,
                                height: 48,
                                //color: Colors.green,
                                child: Column(
                                  children: [
                                    Text(
                                      'Thông tin công tác phòng, chống dịch bệnh Covid-19 trên địa bàn...',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        const Divider(
                          color: Colors.grey,
                          indent: 8,
                          endIndent: 18,
                        ),

                        ///home 5
                        Container(
                          height: 90,
                          width: widthScreen,
                          margin: EdgeInsets.only(right: 6),
                          padding: EdgeInsets.fromLTRB(8, 10, 12, 10),
                          //color: Colors.grey,
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                  image: AssetImage('assets/images/home5.png')),

                              SizedBox(width: 10),

                              ///Thông tin công tác phòng, chống...
                              SizedBox(
                                width: 275,
                                height: 48,
                                //color: Colors.green,
                                child: Column(
                                  children: [
                                    Text(
                                      'Thông tin công tác phòng, chống dịch bệnh Covid-19 trên địa bàn...',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          indent: 8,
                          endIndent: 18,
                        ),

                        ///home 6
                        Container(
                          height: 90,
                          width: widthScreen,
                          margin: EdgeInsets.only(right: 6),
                          padding: EdgeInsets.fromLTRB(8, 10, 12, 10),
                          //color: Colors.grey,
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                  image: AssetImage('assets/images/home6.png')),
                              SizedBox(width: 10),
                              SizedBox(
                                width: 275,
                                height: 48,
                                //color: Colors.green,
                                child: Column(
                                  children: [
                                    Text(
                                      'Thông tin công tác phòng, chống dịch bệnh Covid-19 trên địa bàn...',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          indent: 8,
                          endIndent: 18,
                        ),

                        ///home 5
                        Container(
                          height: 90,
                          width: widthScreen,
                          margin: EdgeInsets.only(right: 6),
                          padding: EdgeInsets.fromLTRB(8, 10, 12, 10),
                          //color: Colors.grey,
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                  image: AssetImage('assets/images/home5.png')),
                              SizedBox(width: 10),
                              SizedBox(
                                width: 275,
                                height: 48,
                                //color: Colors.green,
                                child: Column(
                                  children: [
                                    Text(
                                      'Thông tin công tác phòng, chống dịch bệnh Covid-19 trên địa bàn...',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          indent: 8,
                          endIndent: 18,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
