import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

String _originalText = 'Nothing is saved';
class _TodoListPageState extends State<TodoListPage> {
  String _savedData = _originalText;
  TextEditingController _controller = TextEditingController();

  final _storageKey = 'typed_text';

  _saveData() async {
    String typedText = _controller.text;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_storageKey, typedText);
  }

  _readData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedData = prefs.getString(_storageKey) ?? _originalText;
    });
  }

  _removeData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data persistence test')
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Text(_savedData),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Type something here',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ 
              ElevatedButton(
                child: Text('Save'),
                onPressed: _saveData
              ),
              ElevatedButton(
                child: Text('Read'),
                onPressed: _readData
              ),
              ElevatedButton(
                child: Text('Remove'),
                onPressed: _removeData
              )
            ]
          )
        ]
      )
    )
  );
}
}
