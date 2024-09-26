import 'package:exercise/data/models/user_model.dart';
import 'package:exercise/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {


  const UserScreen({super.key,});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final AuthRepository repository = AuthRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: repository.getUser(), builder: (context, snapshot){
        if(snapshot.hasData){
          return Center(child: Text(snapshot.data?.name ?? "unknown"),);
        } else if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        }
        return const Center(
          child: Text("Something went wrong"),
        );
      })
    );
  }
}
