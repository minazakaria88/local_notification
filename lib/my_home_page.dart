import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_notification/widget/my_text_form.dart';

import 'helpers/date_time_function.dart';
import 'notification_services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController bodyController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Reminder',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            MyTextFormField(
              hintText: 'Title',
              controller: titleController,
              valid: (value) {
                if (value.isEmpty) {
                  return 'Please enter title';
                }
              },
            ),
            MyTextFormField(
              valid: (value) {
                if (value.isEmpty) {
                  return 'Please enter description';
                }
              },
              hintText: 'description',
              controller: bodyController,
            ),
            const SizedBox(
              height: 50,
            ),
            myButton(context),
          ],
        ),
      ),
    );
  }

  Container myButton(BuildContext context) {
    return Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.purple,
            ),
            child: MaterialButton(
              onPressed: ()async{
                if(formKey.currentState!.validate()){
                  final date =await getSelectedDate(context);
                  if(date==null) return;
                  await NotificationServices.scheduleNotification(
                    title: titleController.text,
                    body: bodyController.text,
                    scheduledDate: date,
                  );
                  titleController.clear();
                  bodyController.clear();
                  showSnackBar();
                }
              },
              child: const Text(
                'Schedule Notification',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
  }


  showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Notification Scheduled'),
      ),
    );
  }


}


