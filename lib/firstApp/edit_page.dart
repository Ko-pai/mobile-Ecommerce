import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testp/firstApp/my_page.dart';

class EditPage extends StatefulWidget {
  const EditPage({required this.name, required this.email, super.key});

  final String name;
  final String email;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController _namecontroller;
  late TextEditingController _emailcontroller;

  @override
  void initState() {
    super.initState();
    _namecontroller = TextEditingController(text: widget.name);
    _emailcontroller = TextEditingController(text: widget.email);
  }

  void changeName(value) {
    setState(() {
      _namecontroller.text = value;
    });
  }

  void changeEmail(value) {
    setState(() {
      _emailcontroller.text = value;
    });
  }

  @override
  void dispose() {
    _namecontroller.dispose();
    _emailcontroller.dispose();
    super.dispose();
  }

  void gotoMypage(context) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => MyPage(
          name: _namecontroller.text,
          email: _emailcontroller.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
          title: const Text('Edit'),
        ),
        body: Column(
          children: [
            Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                child: TextField(
                  onChanged: (value) {
                    changeName(value);
                  },
                  controller: _namecontroller,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      decorationThickness: 0),
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.white54, fontSize: 20),
                    hintText: 'Enter here',
                  ),
                  textAlignVertical: TextAlignVertical.top,
                )),
            Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                child: TextField(
                  onChanged: (value) {
                    changeEmail(value);
                  },
                  controller: _emailcontroller,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      decorationThickness: 0),
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 20),
                    hintText: 'Enter here',
                  ),
                  textAlignVertical: TextAlignVertical.top,
                )),
            Container(
                padding: const EdgeInsets.all(20),
                child: FilledButton(
                    style: FilledButton.styleFrom(maximumSize: Size.infinite),
                    onPressed: () {
                      gotoMypage(context);
                    },
                    child: const Text("Update")))
          ],
        ));
  }
}
