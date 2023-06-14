
import 'package:chat_app1/main.dart';
import 'package:chat_app1/screen/Exitpage.dart';
import 'package:flutter/material.dart';

import 'MainPage.dart';
import 'message_list_screen.dart';


class DonateSelect extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find Me',
      home: DonationPage(),
    );
  }
}

class DonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Find Me',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '기부하실 재단을 선택해주세요!',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                DonationCard(
                  image: 'assets/worldvision.png',
                  name: '월드비전',
                  description: '세계의 도움이 필요한 많은 계층을 돕습니다',
                  onPressed: () => _showDonationConfirmationDialog(context, '월드비전'),
                ),
                DonationCard(
                  image: 'assets/unicef.png',
                  name: '유니세프',
                  description: '아프리카의 어려운 상황에 처한 아이들을 돕습니다',
                  onPressed: () => _showDonationConfirmationDialog(context, '유니세프'),
                ),
                DonationCard(
                  image: 'assets/korea.png',
                  name: '대한적십자사',
                  description: '대한민국의 소외 계층을 돕습니다',
                  onPressed: () => _showDonationConfirmationDialog(context, '대한적십자사'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDonationConfirmationDialog(BuildContext context, String donationName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('기부 확인'),
          content: Text('$donationName 재단에 기부하시겠습니까?'),
          actions: [
            TextButton(
              child: Text('확인'),
              onPressed: () {
                _performDonation(context);
              },
            ),
            TextButton(
              child: Text('취소'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _performDonation(BuildContext context) {
    // TODO: 기부 처리 로직을 추가하세요.

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('기부 완료'),
          content: Text('기부가 완료되었습니다. 감사합니다!'),
          actions: [
            TextButton(

              child: Text('확인'),
              onPressed: () {
                // TODO: 확인 버튼을 눌렀을 때 이동될 페이지로 이동하는 코드를 추가하세요.
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MainPage())
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class DonationCard extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final VoidCallback onPressed;

  DonationCard({
    required this.image,
    required this.name,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          image,
          width: 150,
          height: 150,
        ),
        title: Text(
          name,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          description,
          style: TextStyle(fontSize: 14.0),
        ),
        onTap: onPressed,
      ),
    );
  }
}