import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldNew extends StatefulWidget {
  final String initialValue;
  final Function(String) onTaskChanged; // Callback function to update widget.task

  const TextFieldNew({
    Key? key,
    required this.initialValue,
    required this.onTaskChanged, // Receive the callback function through the constructor.
  }) : super(key: key);

  @override
  State<TextFieldNew> createState() => _TextFieldNewState();
}

class _TextFieldNewState extends State<TextFieldNew> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 69,
      width: 380,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), border: Border.all(width: 2, color: const Color(0xffffCBCBCB))),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextField(
          controller: _controller,
          onChanged: (newValue) {
            widget.onTaskChanged(newValue); // Call the callback function to update widget.task
          },
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
