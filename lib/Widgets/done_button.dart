import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Done_Button extends StatelessWidget {
  final VoidCallback onPressed;

  const Done_Button({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: 365,
        height: 61,
        decoration: BoxDecoration(
            color: const Color(0xfff3556AB),
            borderRadius: BorderRadius.circular(6),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(168, 181, 222, 0.5), // Inner shadow color (#A8B5DE with 50% opacity)
                offset: Offset(0, 3), // Inner shadow X: 0, Y: 3
                blurRadius: 1, // Inner shadow blur: 1
                spreadRadius: 0, // Inner shadow spread: 0
              ),
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25), // Drop shadow color (#000000 with 25% opacity)
                offset: Offset(0, 4), // Drop shadow X: 0, Y: 4
                blurRadius: 4, // Drop shadow blur: 4
                spreadRadius: 0, // Drop shadow spread: 0
              ),
            ],
            border: Border.all(
              width: 2,
              color: const Color(0xfff0D2972),
            )),
        child: Center(
          child: Text(
            'Done',
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: const Color(0XFFFFFFFFF),
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
      ),
    );
  }
}
