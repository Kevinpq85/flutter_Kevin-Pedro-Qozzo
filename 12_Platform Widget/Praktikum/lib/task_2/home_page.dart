import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Icon(Icons.create_sharp),
        ),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Text('Edit'),
        ),
        backgroundColor: Colors.white,
        middle: const Text('Chat'),
      ),
      child: SafeArea(
          child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_crop_circle), label: 'Contacts'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone), label: 'Calls'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble), label: 'Chats'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings), label: 'Settings')
        ]),
        tabBuilder: (context, index) {
          return Scaffold(
            body: ListView(children: [
              const CupertinoSearchTextField(
                prefixInsets: EdgeInsets.only(left: 300),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('All Chat', style: TextStyle()),
                  const Text('Work'),
                  const Text('Unread', style: TextStyle(color: Colors.blue)),
                  const Text('Personal')
                ],
              ),
              const ListTile(
                title: Text('Aceng'),
                leading: CircleAvatar(
                  radius: 30,
                ),
                trailing: Text('07:00'),
                subtitle: Text('Yo bro'),
              ),
              const ListTile(
                title: Text('Damar'),
                leading: CircleAvatar(
                  radius: 30,
                ),
                trailing: Text('05:00'),
                subtitle: Text('Ngopi'),
              ),
              const ListTile(
                title: Text('Ucup'),
                leading: CircleAvatar(
                  radius: 30,
                ),
                trailing: Text('kemarin'),
                subtitle: Text('Dimana?'),
              ),
              const ListTile(
                title: Text('Alwan'),
                leading: CircleAvatar(
                  radius: 30,
                ),
                trailing: Text('Kemarin'),
                subtitle: Text('Ngopik'),
              ),
              const ListTile(
                title: Text('Betok'),
                leading: CircleAvatar(
                  radius: 30,
                ),
                trailing: Text('07 Mar'),
                subtitle: Text('P'),
              ),
            ]),
          );
        },
      )),
    );
  }
}
