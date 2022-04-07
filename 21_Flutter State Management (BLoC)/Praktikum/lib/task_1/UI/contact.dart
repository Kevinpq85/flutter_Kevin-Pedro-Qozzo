import 'package:s_21/bloc/contact_bloc.dart';
import 'package:s_21/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:s_21/task_1/UI/chat.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final ContactBloc _contactBloc = ContactBloc();
  @override
  void dispose() {
    _contactBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Select Contact",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  Text(
                    "5 Contacts",
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () => print("Search"),
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () => print("More"),
          ),
        ],
      ),
      body: Container(
          child: StreamBuilder<List<Contact>>(
        stream: _contactBloc.contactListStream,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatScreen(),
                      ));
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                            child: ClipOval(
                          child: Image(
                              height: 50.0,
                              width: 50.0,
                              image: AssetImage(
                                  snapshot.data![index].contactImageUrl),
                              fit: BoxFit.cover),
                        )),
                        title: Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${snapshot.data![index].contactName}",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "${snapshot.data![index].contactNumber}",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black.withOpacity(0.4)),
                            ),
                          ],
                        )),
                        trailing: Container(
                            child: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _contactBloc.deleteTapSink
                                .add(snapshot.data![index]);
                          },
                        )),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      )),
    );
  }
}
