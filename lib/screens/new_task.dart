// ignore_for_file: use_full_hex_values_for_flutter_colors, unnecessary_const

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_test/Widgets/done_button.dart';
import 'package:project_test/Widgets/task_textField.dart';

import '../database/db_helper.dart';

class Newtask extends StatefulWidget {
  const Newtask({super.key});

  @override
  State<Newtask> createState() => _NewtaskState();
}

class _NewtaskState extends State<Newtask> {
  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff3556ab),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          'Add New Task',
          style: GoogleFonts.roboto(
              textStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
            color: const Color(0XFFFFFFFF),
            shadows: [
              Shadow(
                color: Color(0xffff000000), // Shadow color (#FFFFFF)
                offset: Offset(0, 2), // X: 0, Y: 1
                blurRadius: 0, // Blur: 0
              ),
            ],
          )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task Name',
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: const Color(0XFFF000000),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Task_textField(controller: _textFieldController),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Center(child: Done_Button(
                      onPressed: () {
                        saveTask();
                      },
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveTask() async {
    final sqlDb = SqlDb();
    try {
      await sqlDb.insertTask(_textFieldController.text);
      print('is saved');
    } catch (e) {
      // Handle the error here. You can show an error message to the user, log the error, etc.
      print('Failed to save note: $e');
      return;
    }
    // Clear the input fields if the note is successfully saved
    _textFieldController.clear();
  }
}
