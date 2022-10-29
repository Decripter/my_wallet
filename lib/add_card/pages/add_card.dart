import 'package:flutter/material.dart';
import 'package:my_wallet/add_card/pages/components/card_widget.dart';
import 'package:my_wallet/add_card/pages/components/form_widget.dart';

/// Page responsable to allow the user add a card
class AddCardPage extends StatefulWidget {
  ///
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Add Card',
          style: TextStyle(
            fontSize: 28,
            color: Color.fromARGB(164, 0, 0, 0),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            CardWidget(),
            SizedBox(height: 25),
            FormWidget(),
          ],
        ),
      ),
    );
  }
}
