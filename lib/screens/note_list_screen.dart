import 'package:flutter/material.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  int count = 2;
  ListView _getListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.note),
            ),
            title: Text("Note 1"),
            subtitle: Text("This is a note"),
            trailing: Icon(Icons.delete),
            onTap: () {
              debugPrint("onTap ListTile");
            },
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
          elevation: 8,
      ),
      body: _getListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("FloatingActionButton onPressed");
        },
        tooltip: "Add Note",
        child: Icon(Icons.add),
      ),
    );
  }
}
