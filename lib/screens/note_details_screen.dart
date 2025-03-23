import 'package:flutter/material.dart';

class NoteDetailsScreen extends StatefulWidget {
  const NoteDetailsScreen({super.key});

  @override
  State<NoteDetailsScreen> createState() => _NoteDetailsScreenState();
}

class _NoteDetailsScreenState extends State<NoteDetailsScreen> {

  static var _priorities = ['High', 'Low'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note Details"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            ListTile(
              title: DropdownButton(
                  items: _priorities.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  value: _priorities[1],
                  onChanged: (selectedValue) {
                    setState(() {
                      debugPrint("Selected Value: $selectedValue");
                    });
                  }),
            )
            ]
        ),
      ),
    );
  }
}
