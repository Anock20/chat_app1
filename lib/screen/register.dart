import 'package:chat_app1/screen/logIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_app1/main.dart';

String registerId = '';
String registerPw = '';
String registerYear = '';
String registerNum = '';
String registerEmail = '';

class MyRegisterPage extends StatefulWidget {
  @override
  _MyRegisterPageState createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
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
                '아이디를 입력하세요.'
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
                '비밀번호를 입력하세요.'
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
                '생년월일을 입력하세요.'
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

  void showTextDialog4() {
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
                '전화번호를 입력하세요.'
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

  void showTextDialog5() {
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
                '이메일을 입력하세요.'
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

  void _showTextDialog() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Icon(Icons.wb_cloudy_outlined, color: Colors.grey, size: 30),
              content: Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 5, 0),
                child: Text(
                    'Welcome to FindMe!',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                    // fontWeight: FontWeight.w600
                  ),
                ),
              ),
              actions: <Widget>[
                Center(
                  child: TextButton(
                    child: Text(
                      'OK',
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: 17,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => MyLoginPage()
                      //     )
                      // );
                    },
                  ),
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
        elevation: 0.0,
        backgroundColor: Colors.lightGreen,
        title: const Text('Sign up'),
        centerTitle: true,
        actions: [
          // IconButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //       // saveText();
          //     },
          //     icon: Icon(Icons.check)
          // )
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 25,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.edit, size: 15),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '회원가입',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 15,
                ),

                TextField(
                    onChanged: (value) {
                      setState(() {
                        registerId = value;
                      });
                    },
                  decoration: InputDecoration(
                    labelText: 'ID',
                    hintText: '아이디 입력',
                    labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 2.0, color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 2.0, color: Colors.grey),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),

                SizedBox(
                  height: 30,
                ),

                TextField(
                  onChanged: (value) {
                    setState(() {
                      registerPw = value;
                    });
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    hintText: '비밀번호 입력',
                    labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 2.0, color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 2.0, color: Colors.grey),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),

                SizedBox(
                  height: 30,
                ),

                TextField(
                  onChanged: (value) {
                    setState(() {
                      registerYear = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: '생년월일',
                    hintText: '생년월일 입력',
                    labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 2.0, color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 2.0, color: Colors.grey),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  keyboardType: TextInputType.datetime,
                ),

                SizedBox(
                  height: 30,
                ),

                TextField(
                    onChanged: (value) {
                      setState(() {
                        registerNum = value;
                      });
                    },
                  decoration: InputDecoration(
                    labelText: '전화번호',
                    hintText: '전화번호 입력',
                    labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 2.0, color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 2.0, color: Colors.grey),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),

                SizedBox(
                  height: 30,
                ),

                TextField(
                    onChanged: (value) {
                      setState(() {
                        registerEmail = value;
                      });
                    },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: '이메일 입력',
                    labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 2.0, color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 2.0, color: Colors.grey),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress
                ),

                SizedBox(
                  height: 25,
                ),

                ElevatedButton(
                  onPressed: () {
                    if(registerId == "") {
                      showTextDialog();
                    }
                    else if(registerPw == "") {
                      showTextDialog2();
                    }
                    else if(registerYear == "") {
                      showTextDialog3();
                    }
                    else if(registerNum == "") {
                      showTextDialog4();
                    }
                    else if(registerEmail == "") {
                      showTextDialog5();
                    }
                    else {
                      saveText();
                      Navigator.pop(context);
                      _showTextDialog();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        // shape : 버튼의 모양을 디자인 하는 기능

                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      elevation: 0.0
                  ),
                  child: Text("Complete", style: TextStyle(fontSize: 17)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}