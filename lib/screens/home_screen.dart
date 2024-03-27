import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Instagram",
              style: TextStyle(),
            ),
            Container(
              height: 30,
              width: 30,
              child: Icon(
                CupertinoIcons.chevron_down,
              ),
            ),
          ],
        ),
        actions: [
          Icon(
            CupertinoIcons.heart,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            CupertinoIcons.text_bubble,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
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
                        child:const CircleAvatar(
                          radius: 32,
                          backgroundImage: AssetImage(
                            "assets/images/Instagram.png",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
