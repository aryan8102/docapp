import 'package:doctorconsultant/screens/add_post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Post');
  final nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      //

      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query:ref,
              itemBuilder:( context, snapshot, animation,index){
                return Card(
                  child: Column(
                    children: [
                      Card(
                        child: ListTile(
                          title: Text(snapshot.child('clinicName').value.toString()),

                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text(snapshot.child('specialistName').value.toString()),

                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text(snapshot.child('name').value.toString()),

                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text(snapshot.child('qualification').value.toString()),

                        ),
                      ),
                    ],
                  ),
                );
              }
            ),
          ),


        ],
      ),

    );
  }
}
