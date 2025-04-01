import 'package:flutter/material.dart';

class NoteDetailsScreen extends StatefulWidget {
  const NoteDetailsScreen({super.key});

  @override
  State<NoteDetailsScreen> createState() => _NoteDetailsScreenState();
}

class _NoteDetailsScreenState extends State<NoteDetailsScreen> {
  _NoteDetailsScreenState();

  static final _priorities = ['High', 'Low'];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void moveToLastScreen() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
        leading: IconButton(
          onPressed: () => moveToLastScreen(),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            ListTile(
              title: DropdownButton(
                items:
                    _priorities.map((String item) {
                      return DropdownMenuItem(value: item, child: Text(item));
                    }).toList(),
                value: _priorities[1],
                onChanged: (selectedValue) {
                  setState(() {
                    debugPrint("Selected Value: $selectedValue");
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child: TextField(
                controller: titleController,
                onChanged: (value) {
                  debugPrint("title");
                },
                decoration: InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child: TextField(
                controller: descriptionController,
                onChanged: (value) {
                  debugPrint("Description");
                },
                decoration: InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          debugPrint("save");
                        });
                      },
                      child: Text("Save"),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          debugPrint("delete");
                        });
                      },
                      child: Text("Delete"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
