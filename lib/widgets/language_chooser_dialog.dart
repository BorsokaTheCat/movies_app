import 'package:flutter/material.dart';

class LanguageChooserDialog extends StatefulWidget {
  @override
  _LanguageChooserDialogState createState() => _LanguageChooserDialogState();
}

class _LanguageChooserDialogState extends State<LanguageChooserDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Choose Language'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                // Handle language selection here
                Navigator.pop(context); // Close the dialog
              },
              child: Text('English'),
            ),
            GestureDetector(
              onTap: () {
                // Handle language selection here
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Spanish'),
            ),
            GestureDetector(
              onTap: () {
                // Handle language selection here
                Navigator.pop(context); // Close the dialog
              },
              child: Text('French'),
            ),
          ],
        ),
      ),
    );
  }
}
