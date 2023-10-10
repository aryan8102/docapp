import 'package:doctorconsultant/screens/doctorportal.dart';
import 'package:doctorconsultant/utils/utils.dart';
import 'package:doctorconsultant/widget/round_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {


  final clinicController = TextEditingController();
  final specialistController = TextEditingController();
  final nameController = TextEditingController();
 final qualificationController = TextEditingController();
 final cliniccenterController = TextEditingController();
 final ContactController = TextEditingController();
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Post');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Register Yourself',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20),
        child: Column(
          children: [
         SizedBox(
           height: 30,
         ),

            TextFormField(
              maxLines: 1,
              controller: specialistController,
              decoration: InputDecoration(
                  hintText: 'Specilist',
                  border: OutlineInputBorder()

              ),
            ),
            TextFormField(
              maxLines: 1,
              controller: nameController,
              decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder()

              ),
            ),
            TextFormField(
              maxLines: 1,
              controller: qualificationController,
              decoration: InputDecoration(
                  hintText: 'Qualification',
                  border: OutlineInputBorder()

              ),
            ),

            TextFormField(
              maxLines: 1,
              controller: clinicController,
              decoration: InputDecoration(
                  hintText: 'Contact ',
                  border: OutlineInputBorder()

              ),
            ),


            SizedBox(
              height: 30,
            ),
            RoundButton(
                title: 'Add',
                loading: loading,
                onTap: (){
                  setState(() {
                    loading=true;
                  });
                  databaseRef.child(DateTime.now().microsecondsSinceEpoch.toString()).set({

                    'specialistName':specialistController.text.toString(),
                    'name':nameController.text.toString(),
                    'qualification':qualificationController.text.toString(),

                    'contact':ContactController.text.toString(),
                    'id':DateTime.now().microsecondsSinceEpoch.toString(),
                 }).then((value){
                    utils().toastMessage('Post Added');
                    setState(() {
                      loading=false;
                    });
                  }).onError((error, stackTrace) {
                    utils().toastMessage(error.toString());
                    setState(() {
                      loading=false;
                    });
                  });
                }),
          ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>RegistrationScreen()));
              },
              child: Text('Doctor Portal'))
          ],

        ),


      ),


    );
  }
}
