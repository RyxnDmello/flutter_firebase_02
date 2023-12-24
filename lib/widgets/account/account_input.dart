import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountInput extends StatefulWidget {
  const AccountInput({
    required this.validateInput,
    required this.saveInput,
    required this.label,
    required this.icon,
    this.isHidden = false,
    super.key,
  });

  final String? Function(String? input) validateInput;
  final void Function(String? input) saveInput;
  final bool isHidden;
  final IconData icon;
  final String label;

  @override
  State<AccountInput> createState() => _AccountInputState();
}

class _AccountInputState extends State<AccountInput> {
  Color color = Colors.white;

  void onChanged({required String value}) {
    if (value.isEmpty) {
      setState(() => color = Colors.white);
      return;
    }

    setState(
      () => color = const Color.fromARGB(255, 0, 200, 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => widget.validateInput(value),
      onSaved: (newValue) => widget.saveInput(newValue),
      onChanged: (value) => onChanged(value: value),
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        color: Colors.white,
        letterSpacing: 1,
        fontSize: 20,
        height: 1,
      ),
      cursorWidth: 1.5,
      cursorColor: Colors.white,
      obscureText: widget.isHidden,
      decoration: InputDecoration(
        hintText: widget.label,
        hintStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: Colors.white,
          letterSpacing: 1,
          fontSize: 20,
          height: 1,
        ),
        prefixIcon: Icon(
          widget.icon,
          color: Colors.white,
        ),
        contentPadding: const EdgeInsets.fromLTRB(0, 20, 10, 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: color,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 200, 0, 0),
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 200, 0, 0),
            width: 2,
          ),
        ),
      ),
    );
  }
}
