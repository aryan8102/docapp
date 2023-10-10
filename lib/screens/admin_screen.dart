import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {

  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Post2');
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
     title: Text('PatientInfo',style: TextStyle(fontWeight: FontWeight.bold),),
   ),
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
                          title: Text(snapshot.child('name').value.toString()),
                        ),
                      )
                    ],
                  ),
                );
                }
            ),
          )
        ],
      ),
    );
  }
}
