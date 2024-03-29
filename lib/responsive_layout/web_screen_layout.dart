import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart' as model;
import '../provider/user_provider.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    model.UsersModel? usersModel = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: Center(
        child: Text(usersModel!.username),
      ),
    );
  }
}
