import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'credential_user_wallet.dart';

class WolletUser extends StatelessWidget {
  const WolletUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent resizing when keyboard appears

      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.red.shade300,
        title: Text(
          'Your Wallet',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: WalletCredentials(),
    );
  }
}
