
import 'package:chat_app1/screen/register.dart';
import 'package:chat_app1/screen/searchPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'customizing.dart';
import 'editProfile.dart';
import 'logIn.dart';
import 'messageBox.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        elevation: 0.0,
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
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/profile3.png'),
                  backgroundColor: Colors.white,
                ),
              // otherAccountsPictures: [
              //   CircleAvatar(
              //     backgroundColor: Colors.white,
              //     backgroundImage: AssetImage('assets/YJ.jpg'),
              //   )
              // ],
              accountName: Text(registerId, style: TextStyle(fontSize: 17)),
              accountEmail: Text(registerEmail, style: TextStyle(fontSize: 14)),
              onDetailsPressed: () {
                print('arrow is clicked');
              },
              decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30.0)
                  )
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.search,
                color: Colors.grey[850],
              ),
              title: Text('ID Search'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.chat_bubble_outline,
                color: Colors.grey[850],
              ),
              title: Text('Message'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MessageBox()),
                );
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.grey[850],
              ),
              title: Text('Edit profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfile()),
                );
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[850],
              ),
              title: Text('Setting'),
              onTap: () {

              },
              trailing: Icon(Icons.add),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          // SizedBox(
          //   height: 3,
          // ),
          Container(
              height: 174,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(20),
                // borderRadius: BorderRadius.only(
                //   // bottomLeft: Radius.circular(50),
                //     bottomRight: Radius.circular(40)
                // ),
                color: Colors.grey[200],
                // border: Border.all(
                //   color: Colors.grey,
                //   width: 1
                // )
              ),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child: Center(
                              child: CircleAvatar(
                                backgroundImage: AssetImage('assets/profile3.png'),
                                radius: 40.0,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 9,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(registerId,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.0
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 22, 0),
                                  child: Container(
                                      height: 70,
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1,
                                          )
                                      ),
                                      child: Text(
                                        savedText,
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 15
                                        ),
                                      )
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(
                        //   // width: 30,
                        // ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.grey[400],
                              // side: const BorderSide(color: Colors.grey, width: 1.5),
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                              )
                          ),
                          child: Text('Edit profile', style: TextStyle(color: Colors.grey[800], fontSize: 15)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EditProfile()),
                            );
                          },
                        ),
                        SizedBox(
                          width: 45,
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.grey[400],
                              // side: const BorderSide(color: Colors.grey, width: 1.5),
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))
                          ),
                          child: Text('Log out', style: TextStyle(color: Colors.grey[800], fontSize: 15)),
                          onPressed: () {
                            loginId = "";
                            loginPw = "";
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyLoginPage()),
                            );
                            // 로그인 화면으로 이동
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          // SizedBox(
          //   height: 30,
          // ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 85,
                ),
                TextButton.icon(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CustomPage()),
                      );
                    },
                    icon: Icon(Icons.edit, color: Colors.lightGreen),
                    label: Text(
                      '스티커 변경',
                      style: TextStyle(
                        color: Colors.black
                      )
                    )
                ),
                // Divider(
                //   height: 5.0,
                //   indent: 30,
                //   endIndent: 30,
                //   color: Colors.grey,
                //   thickness: 0.5,
                // ),
                SizedBox(
                  height: 10,
                ),
                TextButton.icon(
                    onPressed: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => EditProfile()),
                      // );
                    },
                    icon: Icon(Icons.check_circle_outline, color: Colors.lightGreen,),
                    label: Text(
                      '스티커 이미지 저장',
                      style: TextStyle(
                        color: Colors.black
                      ),
                    )
                ),
              ],
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => MainPage()),
                    // );
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MessageBox()),
                    );
                  },
                  icon: Icon(Icons.chat_bubble_outline), iconSize: 30, color: Colors.lightGreen[700]
              )
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
      ),
    );
  }
}