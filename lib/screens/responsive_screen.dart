import 'package:exercise/screens/responsive_widget.dart';
import 'package:flutter/material.dart';

class ResponsiveScreen extends StatefulWidget {
  const ResponsiveScreen({super.key});

  @override
  State<ResponsiveScreen> createState() => _ResponsiveScreenState();
}

class _ResponsiveScreenState extends State<ResponsiveScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    print(size.width);
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(child: Container(color: Colors.green,),),
      body: ResponsiveWidget(webChild: Center(child: Column(children: [
        Text("Bu Web app"),
        Text("Bu yangi font", style: TextStyle(fontFamily: "Teko"),),

      ],),), planshetChild: Text("Bu planshet "), phone: Text("Bu telefon"),)

    );
  }
}
