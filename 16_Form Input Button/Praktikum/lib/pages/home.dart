import 'package:dojo/pages/models/userModel.dart';
import 'package:dojo/pages/userDetail.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<User> user = [
    User(name: "kevin", phoneNumber: "087 755 6221", imgUrl: "assets/guy.jpg"),
    User(name: "Betok", phoneNumber: "087 155 6221", imgUrl: "assets/guy.jpg"),
    User(name: "Alwan", phoneNumber: "087 755 6221", imgUrl: "assets/guy.jpg"),
    User(name: "Aceng", phoneNumber: "087 755 6221", imgUrl: "assets/guy.jpg"),
    User(name: "Awang", phoneNumber: "087 755 6221", imgUrl: "assets/guy.jpg"),
    User(name: "Arik", phoneNumber: "087 755 6221", imgUrl: "assets/guy.jpg"),
    User(name: "Mamat", phoneNumber: "087 755 6221", imgUrl: "assets/guy.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Contacts"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetails(user: user)
            ));
        }),
        body: ListView(children: <Widget>[
          IntrinsicWidth(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 40, 10, 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "SEARCH",
                          hintStyle: TextStyle(fontWeight: FontWeight.normal),
                          prefixIcon: Icon(Icons.search)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: user.map((user) {
              return UserCard(user: user);
            }).toList(),
          )
        ]));
  }
}

class UserCard extends StatelessWidget {
  final User user;
  UserCard({required this.user});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserDetails(
                        user: user,
                      )));
        },
        leading: CircleAvatar(backgroundImage: AssetImage(user.imgUrl)),
        title: Text(
          user.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(user.phoneNumber),
        trailing: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.call,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.message,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
