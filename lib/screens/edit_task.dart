import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_test/Widgets/textField_new.dart';

import '../Widgets/done_button.dart';

import '../database/db_helper.dart';

class EditTask extends StatefulWidget {
  final int id;
  final String task;
  const EditTask({super.key, required this.id, required this.task});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  String _editedTask = '';
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
          'Edit Task',
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
              child: TextFieldNew(
                  initialValue: widget.task,
                  onTaskChanged: (newValue) {
                    setState(() {
                      _editedTask = newValue; // Update the local variable with the edited task
                    });
                  }),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Center(child: Done_Button(
                      onPressed: () {
                        updateNote();
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

  void updateNote() async {
    final sqlDb = SqlDb();
    try {
      await sqlDb.updateNote(widget.id, _editedTask); // Pass the edited task to the updateNote method
    } catch (e) {
      // Handle the error here. You can show an error message to the user, log the error, etc.
      print('Failed to update note: $e');
      return;
    }
    print('the note successfully updated');
    Navigator.pop(context);
  }
}
