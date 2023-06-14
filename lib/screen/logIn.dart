import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MainPage.dart';
import 'register.dart'; //회원가입 페이지로 연결
import 'package:chat_app1/main.dart';

String loginId = "";
String loginPw = "";


class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {

  TextEditingController _textEditingController = TextEditingController();

  void saveText() {
    setState(() {
      savedText = _textEditingController.text;
    });
  }

  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void showTextDialog() {
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
                  '아이디 혹은 비밀번호가 틀렸습니다.'
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

  void showTextDialog2() {
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
                '아이디를 입력하세요!'
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

  void showTextDialog3() {
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
                '비밀번호를 입력하세요!'
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text('Find me'),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.lightGreen),
          onPressed: (){},
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  SizedBox(
                    height: 80,
                  ),

                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.login_outlined, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  TextField(
                      onChanged: (value) {
                        loginId = value;
                      },
                      decoration: InputDecoration(
                    labelText: 'ID',
                    hintText: '아이디 입력',
                    labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(width: 2.0, color: Colors.lightGreen),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(width: 2.0, color: Colors.lightGreen),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                    keyboardType: TextInputType.text,
                  ),

                  SizedBox(
                    height: 30,
                  ),


                  TextField(
                    onChanged: (value) {
                      loginPw = value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      hintText: '비밀번호 입력',
                      labelStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(width: 2.0, color: Colors.lightGreen),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(width: 2.0, color: Colors.lightGreen),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),

                  SizedBox(
                    height: 50,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          registerId = "";
                          registerEmail = "";
                          registerNum = "";
                          registerYear = "";
                          registerPw = "";
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyRegisterPage(), // 회원가입 버튼을 누르면 회원가입 페이지(register.dart)로 이동해준다.
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 0.0,
                        ),
                        child: Text("Sign up", style: TextStyle(fontSize: 17)),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          if(loginId == "") {
                            showTextDialog2();
                          }
                          else if(loginPw == "") {
                            showTextDialog3();
                          }
                          else if(loginId != registerId) {
                            showTextDialog();
                          }
                          else {
                            saveText();
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MainPage()
                                )
                            );
                          }
                        }, // 로그인 버튼을 누르면
                        style: ElevatedButton.styleFrom(
                            primary: Colors.lightGreen,
                            shape: RoundedRectangleBorder(
                              // shape : 버튼의 모양을 디자인 하는 기능

                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            elevation: 0.0
                        ),
                        child: Text("Login", style: TextStyle(fontSize: 17)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}