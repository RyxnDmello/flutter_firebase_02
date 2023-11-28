import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashFormInput extends StatelessWidget {
  const SplashFormInput({
    required this.validateInput,
    required this.saveInput,
    super.key,
  });

  final String? Function(String? value) validateInput;
  final void Function(String? value) saveInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validateInput(value),
      onSaved: (newValue) => saveInput(newValue),
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
          "Home City",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            letterSpacing: 0.65,
            fontSize: 20,
            height: 0,
          ),
        ),
        border: const OutlineInputBorder(
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
            color: Color.fromARGB(250, 255, 0, 0),
            width: 2,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 255, 0, 0),
            width: 2,
          ),
        ),
        errorStyle: GoogleFonts.poppins(
          color: const Color.fromARGB(255, 255, 0, 0),
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          fontSize: 12.5,
        ),
      ),
    );
  }
}
