import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesSearchInput extends StatelessWidget {
  const FavoritesSearchInput({
    required this.saveInput,
    super.key,
  });

  final void Function(String? input) saveInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (newValue) => saveInput(newValue),
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        color: Colors.white,
        letterSpacing: 1,
        fontSize: 20,
      ),
      cursorWidth: 1.5,
      cursorColor: Colors.white,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 12.5, 12.5, 12.5),
        label: Text(
          "City",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 20,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),
    );
  }
}
