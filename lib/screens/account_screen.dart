import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart' as model;
import '../provider/user_provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    model.UsersModel? usersModel = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        usersModel!.photoUrl,
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                        ))
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Row(
                  children: [
                    const Text(
                      "2\nPosts",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Text(
                      "${usersModel.followers}\followers",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Text(
                      "${usersModel.followers}\following",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              "${usersModel.username}",
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            Text(
              "${usersModel.username}",
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            Text(
              "${usersModel.bio}",
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  child: const Text("Edit profile"),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  child: const Text("Share profile"),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  child: const Icon(
                    Icons.account_circle_outlined,
                  ),
                ),
              ],
            ),
            Container(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red, width: 2),
                              shape: BoxShape.circle),
                          child: const CircleAvatar(
                            radius: 32,
                            backgroundImage: AssetImage(
                              "assets/images/Instagram.png",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    );
                  }),
            ),
            Row(
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    icon: Icon(Icons.menu),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    icon: Icon(Icons.screen_lock_landscape),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        index = 2;
                      });
                    },
                    icon: Icon(Icons.account_circle_outlined),
                  ),
                ),
              ],
            ),
            IndexedStack(
              index: index,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.purple,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.yellow,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
