import 'package:chat_app1/screen/editProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_app1/screen/searchPage.dart';
import 'package:chat_app1/main.dart';

import 'MainPage.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';


class MessageBox extends StatefulWidget {
  // MyApp({Key? key}) : super(key: key);

  @override
  _MessageBoxState createState() => _MessageBoxState();
// Widget build(BuildContext context){
//   return MaterialApp(
//     debugShowCheckedModeBanner: false,
//   );
// }

}

class _MessageBoxState extends State<MessageBox> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        home: Scaffold(

          appBar: AppBar(
            backgroundColor: Colors.lightGreen,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                  icon: Icon(Icons.person))
            ],
            title: Text(
                'Message',
                style: TextStyle(color: Colors.white)
            ),
            centerTitle: true,
            elevation: 0.0,
          ), //상단 위젯, menu 아이콘 -- 아이디검색 텍스트 -- 프로필 아이콘
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: (){
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ()),
                  // );
                  // 채팅방으로 이동
                },
                child: Container(
                    width: double.infinity,
                    height: 80,
                    color: Colors.black12,
                    child:Row(
                      children: [
                        SizedBox(width: 20),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('assets/profile2.png'),
                          radius: 19,
                          // backgroundColor: Colors.lightGreen,
                        ),
                        SizedBox(width: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'SEOHO',
                                style:TextStyle(
                                    color:Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            SizedBox(width: 20,),
                            Text(
                                '새로운 메시지가 도착했습니다.',
                              style: TextStyle(color: Colors.black54),
                            )
                          ],
                        )
                      ],
                    )
                ),
              )
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // TextButton.icon(
                  //     onPressed: (){
                  //       // Navigator.push(
                  //       //   context,
                  //       //   MaterialPageRoute(builder: (context) => SearchPage()),
                  //       // );
                  //     },
                  //     icon: Icon(Icons.search, size: 20, color: Colors.lightGreen[700]),
                  //     label: Text('search', style: TextStyle(
                  //         color: Colors.lightGreen[700], fontSize: 15
                  //     ),
                  //     )
                  // ),
                  IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchPage()),
                        );
                      },
                      icon: Icon(Icons.search), iconSize: 30, color: Colors.lightGreen[700]
                  ),
                  IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()),
                        );
                      },
                      icon: Icon(Icons.home), iconSize: 30, color: Colors.lightGreen[700]
                  ),
                  // TextButton.icon(
                  //     onPressed: (){
                  //       // Navigator.push(
                  //       //   context,
                  //       //   MaterialPageRoute(builder: (context) => ChatPage()),
                  //       // );
                  //     },
                  //     icon: Icon(Icons.chat_bubble_outline, size: 20, color: Colors.lightGreen[700]),
                  //     label: Text('chat', style: TextStyle(
                  //         color: Colors.lightGreen[700], fontSize: 15
                  //     ),)
                  // ),
                  IconButton(
                      onPressed: (){
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => MessageBox()),
                        // );
                      },
                      icon: Icon(Icons.chat_bubble_outline), iconSize: 30, color: Colors.lightGreen[700]
                  ),
                  // IconButton(
                  //   onPressed: (){
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => EditProfile()),
                  //     );
                  //   },
                  //   icon: Icon(Icons.person_outline), iconSize: 30, color: Colors.lightGreen[700],
                  // ),
                  // IconButton(
                  //     onPressed: (){},
                  //     icon: Icon(Icons.settings), iconSize: 30, color: Colors.lightGreen[700]
                  // ),
                ],
              ),
            ),
          ),//하단 위젯
        )
      //위젯은 맨앞은 대문자, 뒤는 소문자
      //위젯 종류 : 글자(Text('글자')), 이미지(Image.asset('경로') / assets폴더에 저장 후 pubspec.yaml 파일에 등록), 아이콘(Icon(Icons.아이콘이름)), 박스(Container(), Sizedbox)

    );
  }
}