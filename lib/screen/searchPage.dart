import 'package:chat_app1/screen/messageBox.dart';
import 'package:chat_app1/screen/register.dart';
import 'package:chat_app1/screen/showProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chat_app1/main.dart';
import 'package:chat_app1/screen/editProfile.dart';
import 'package:chat_app1/screen/showProfile2.dart';

import 'MainPage.dart';
import 'message_list_screen.dart';

// import 'package:flutter_localizations/flutter_localizations.dart';


class SearchPage extends StatefulWidget {
  // MyApp({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  TextEditingController textEditingController = TextEditingController();

  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  String inputId = "";

  void _showTextDialog() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Error',
                style: TextStyle(
                    color: Colors.grey
                ),
              ),
              content: Text(
                  '존재하지 않는 아이디입니다.'
              ),
              actions: <Widget>[
                Center(
                    child: TextButton(
                      child: Text(
                        'OK',
                        style: TextStyle(
                            color: Colors.lightGreen,
                            fontSize: 17
                        ),
                      ),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    )
                )
              ],
            );
          }
      );
    }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        // 아이디 하나를 정해서 그걸 넣고 검색하기 누르면 프로필로 넘어가고, 그거랑 다르면 등록되지 않은 아이디라고 뜨게 함.
        home: Scaffold(

          appBar: AppBar(
            backgroundColor: Colors.lightGreen,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
            ),
            elevation: 0.0,
            title: Text('ID Search', style: TextStyle(color: Colors.white)),
            centerTitle: true,
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
          ), //상단 위젯, menu 아이콘 -- 아이디검색 텍스트 -- 프로필 아이콘
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                              onChanged: (value) {
                                inputId = value;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search, color: Colors.lightGreen, size: 28),
                                hintText: '아이디를 입력하세요.',
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    // height: 3
                                ),
                                // border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                  borderSide: BorderSide(width: 2.5, color: Colors.lime),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                  borderSide: BorderSide(width: 2.5, color: Colors.lime),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(13.0)
                                  ),
                                ),
                              ),
                      keyboardType: TextInputType.text,
                      ),

                    SizedBox(height: 40),

                    TextButton(
                        onPressed:
                            (){
                          if (inputId == "") {}
                          else if(inputId == registerId) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => showProfile2()),
                            );
                          }
                          else if (inputId == "SEOHO") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => showProfile()),
                            );
                          }
                          else{
                            _showTextDialog();
                          }
                        }, //버튼 누르면 아이디가 ""와 같으면 그 프로필로 넘어가고, ""와 다르면 "존재하지 않는 아이디입니다."출력,
                        child: Text('Search', style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        )),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightGreen,
                            // backgroundColor: Colors.lightGreen,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            )
                        )
                    )
                  ]
                ),
              ),
            ),
          ),
            bottomNavigationBar: BottomAppBar(
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: (){
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => SearchPage()),
                          // );
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
                    IconButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MessageBox()),
                          );
                        },
                        icon: Icon(Icons.chat_bubble_outline), iconSize: 30, color: Colors.lightGreen[700]
                    ),
                    // IconButton(
                    //   onPressed: (){
                    //     // Navigator.push(
                    //     //   context,
                    //     //   MaterialPageRoute(builder: (context) => NextPage()),
                    //     // );
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
            ), //하단 위젯
        )
      //위젯은 맨앞은 대문자, 뒤는 소문자
      //위젯 종류 : 글자(Text('글자')), 이미지(Image.asset('경로') / assets폴더에 저장 후 pubspec.yaml 파일에 등록), 아이콘(Icon(Icons.아이콘이름)), 박스(Container(), Sizedbox)

    );
  }
}