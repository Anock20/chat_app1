import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'message_list_screen.dart';


class Donate extends StatefulWidget {
  const Donate({Key? key}) : super(key: key);

  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  TextEditingController textController = TextEditingController();
  bool isChecked = false;
  int donationAmount = 0;

  @override
  Widget build(BuildContext context) {

    void _onPressedEOK2Button() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MessageListScreen()),
      );
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
          title: const Text('Find Me'),
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    '분실물 찾기가 완료되면',
                    style: const TextStyle(fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text('선택하신 재단에 기부가 됩니다!',
                      style: const TextStyle(fontSize: 24.0,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 80),
                  if (!isChecked)
                    TextFormField(
                        controller: textController,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(width: 2.0, color: Colors.lightGreen)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(width: 2.0, color: Colors.lightGreen)
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          hintText: '기부 금액을 입력해주세요 (원)',
                        ),
                        textAlign: TextAlign.right,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          _CurrencyInputFormatter(), // Custom input formatter
                        ],
                        keyboardType: TextInputType.number
                    ),
                  SizedBox(height:30),
                  const Text(
                    '최소금액: 5000원',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                            if (isChecked) {
                              textController.clear();
                            }
                          });
                        },
                      ),
                      const Text('기부를 하지 않을래요'),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        onPressed: () {
                          if (isChecked) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('기부하지 않겠습니다'
                                      ,style: TextStyle(fontSize: 18)),
                                  actions: [
                                    TextButton(
                                      onPressed: _onPressedEOK2Button,
                                      child: const Text('확인', style: TextStyle(color: Colors.lightGreen)),
                                    ),

                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('취소', style: TextStyle(color: Colors.lightGreen)),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            final inputAmount = int.tryParse(textController.text.replaceAll(',', ''));

                            if (inputAmount == null) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('기부 금액을 입력해주세요!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('확인', style: TextStyle(color: Colors.lightGreen)),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else if (inputAmount < 5000) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('최소 기부 금액은 5000원입니다!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('확인', style: TextStyle(color: Colors.lightGreen)),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  final formatter = NumberFormat('#,###');
                                  final formattedAmount = formatter.format(inputAmount);

                                  return AlertDialog(
                                    title: Text('$formattedAmount 원을 기부하시겠습니까?'),
                                    actions: [
                                      TextButton(
                                        onPressed: _onPressedEOK2Button,
                                        child: const Text('확인', style: TextStyle(color: Colors.lightGreen)),
                                      ),

                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('취소', style: TextStyle(color: Colors.lightGreen)),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightGreen,
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        ),
                        child: const Text('OK'),
                      );
                    },
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

class _CurrencyInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    final cleanText = newValue.text.replaceAll(',', '');
    final number = int.parse(cleanText);

    final formattedValue = NumberFormat('#,###').format(number);

    return newValue.copyWith(
      text: formattedValue,
      selection: TextSelection.collapsed(
        offset: formattedValue.length,
      ),
    );
  }
}