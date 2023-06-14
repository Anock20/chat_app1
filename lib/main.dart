import 'package:chat_app1/screen/customizing.dart';
import 'package:chat_app1/screen/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chat_app1/screen/editProfile.dart';
import 'package:chat_app1/screen/searchPage.dart';
import 'package:chat_app1/screen/logIn.dart';
import 'package:chat_app1/screen/messageBox.dart';

import 'firebase_options.dart';

String savedText =''; // 상태메시지 입력값

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Find me',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
      ),
      home: MyLoginPage(),
    );
  }
}
