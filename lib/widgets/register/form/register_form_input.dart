import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterFormInput extends StatelessWidget {
  const RegisterFormInput({
    required this.label,
    this.isPassword = false,
    super.key,
  });

  final bool isPassword;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        color: Colors.white,
        letterSpacing: 1,
        fontSize: 20,
      ),
      cursorWidth: 1.5,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        label: Text(
          label,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            letterSpacing: 0.65,
            fontSize: 20,
            height: 0,
          ),
        ),
        border: const OutlineInputBorder(
          gapPadding: 10,
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 255, 50, 0),
            width: 2,
          ),
        ),
      ),
    );
  }
}
