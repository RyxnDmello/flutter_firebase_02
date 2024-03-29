import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterFormButton extends StatelessWidget {
  const RegisterFormButton({
    required this.isAuthenticating,
    required this.onSubmitForm,
    required this.label,
    super.key,
  });

  final void Function() onSubmitForm;
  final bool isAuthenticating;
  final String label;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onSubmitForm,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        side: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isAuthenticating)
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            ),
          if (isAuthenticating)
            const SizedBox(
              width: 12.5,
            ),
          Text(
            isAuthenticating ? "Authenticating..." : label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              color: Colors.white,
              letterSpacing: 1.25,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
