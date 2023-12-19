import 'package:flutter/material.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          SafeArea(
              child: ListTile(
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
            subtitleTextStyle: TextStyle(color: Colors.grey.shade300),
            subtitle: Text(
              "Name Google",
              style: TextStyle(fontSize: 15),
            ),
            trailing: Ink(
                height: 40,
                width: 20,
                child: InkWell(
                  onTap: () {},
                  splashColor: Colors.amber,
                  child: Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                )),
            title: Text(
              "Hallo",
            ),
            leading: CircleAvatar(
                radius: 60, child: Image.asset('lib/models/Image/Profile.png')),
          ))
        ],
      ),
    );
  }
}
