import 'package:chat_app1/screen/logIn.dart';
import 'package:chat_app1/screen/messageBox.dart';
import 'package:chat_app1/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:chat_app1/main.dart';
import 'package:chat_app1/screen/searchPage.dart';

import 'MainPage.dart';

class EditProfile extends StatefulWidget {
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _textEditingController = TextEditingController();

  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void saveText() {
    setState(() {
      savedText = _textEditingController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Find me',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        // backgroundColor: Colors.lightGreen[700],
        appBar: AppBar(
          title: Text('Edit profile'),
          backgroundColor: Colors.lightGreen,
          centerTitle: true,
          elevation: 0.0,
          leading:
          IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()
                    )
                  );
                  // saveText();
                },
                icon: Icon(Icons.check)
            )
          ],
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              // padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
              padding: EdgeInsets.all(20),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/profile3.png'),
                    radius: 55.0,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Divider(
                    height: 10.0,
                    color: Colors.grey,
                    thickness: 0.8,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text('ID',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey[600],
                      letterSpacing: 2.0,
                    ),),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(registerId,
                    style: TextStyle(
                        fontSize: 29.0,
                        color: Colors.grey[800],
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 11,
                          child: TextField(
                            controller: _textEditingController, // 텍스트 줄바꿈
                            maxLines: null, // 텍스트 줄바꿈
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(130), // 글자수 제한
                            ],
                            decoration: InputDecoration(
                              labelText: '상태메시지',
                              hintText: '내용 입력',
                              labelStyle: TextStyle(color: Colors.grey),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(width: 2.0, color: Colors.lightGreen),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(width: 2.0, color: Colors.lightGreen),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              ),
                            ),
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          flex: 3,
                          child: ElevatedButton(
                              onPressed: (){
                                saveText();
                                FocusScope.of(context).requestFocus(FocusNode());
                              },
                              child: Text('OK', style: TextStyle(fontSize: 18)),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.lightGreen,
                                  padding: EdgeInsets.all(10)
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                ],
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
        ),
      ),
    );
  }
}