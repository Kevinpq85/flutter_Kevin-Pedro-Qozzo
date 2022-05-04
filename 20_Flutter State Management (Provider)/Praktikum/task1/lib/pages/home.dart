import 'package:flutter/material.dart';

import '../data/model.dart';
import 'form.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/';
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          Navigator.pushNamed(context, MyForm.routeName);
        },
        child: const Icon(Icons.person_add,color: Colors.white,),
      ),
      appBar: AppBar(
        title: const Text('Contacts'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: contacts.isEmpty ? const Center(child: Text('Contact is empty')) :
        ListView.separated(
          itemBuilder: (context, i){
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(contacts[i].name[0].toUpperCase(), style: const TextStyle(color: Colors.white),),
              ),
              title: Text(contacts[i].name),
              subtitle: Text(contacts[i].phoneNumber),
            );
          },
          separatorBuilder: (context, i){
            return Divider(
              color: Colors.grey[600],
              thickness: 0,
              height: 0,
            );
          },
          itemCount: contacts.length
        ),
      ),
    );
  }
}