import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height * 0.55;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(45),
        topRight: Radius.circular(45),
      ),
      child: Container(
        width: width,
        height: height,
        color: const Color.fromARGB(207, 223, 255, 182),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'CREDIT CARD NUMBER',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'CARD HOLDER NAME',
                  ),
                ),
              ),
              Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(18),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'CVV',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'EXPIRY',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Clear'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Save'),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
