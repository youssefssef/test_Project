import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Task_textField extends StatefulWidget {
  final TextEditingController controller; // Declare the controller as a property.

  const Task_textField({
    Key? key,
    required this.controller, // Receive the controller through the constructor.
  }) : super(key: key);

  @override
  State<Task_textField> createState() => _Task_textFieldState();
}

class _Task_textFieldState extends State<Task_textField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 69,
      width: 380,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), border: Border.all(width: 2, color: const Color(0xffffCBCBCB))),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextField(
          controller: widget.controller,
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent), // Remove the underline
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent), // Remove the underline when focused
            ),
          ),
          style: GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400, color: Color(0xfff0D2972))),
        ),
      ),
    );
  }
}
