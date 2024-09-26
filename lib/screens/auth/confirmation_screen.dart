import 'package:flutter/material.dart';

class ConfirmationScreen extends StatefulWidget {
  final String phoneNumber;
  final String token;

  const ConfirmationScreen(
      {super.key, required this.phoneNumber, required this.token});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  final TextEditingController _codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Column(
      children: [
        Text(widget.phoneNumber),
        SizedBox(height: 40,),
        Text(widget.token),
        TextFormField(controller: _codeController,),


        SizedBox(height: 100,),

      ],
    )),);
  }
}
