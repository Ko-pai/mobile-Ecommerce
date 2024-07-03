import 'package:flutter/material.dart';
import 'package:testp/firstApp/edit_page.dart';

class MyPage extends StatefulWidget {
  const MyPage({required this.name, required this.email, super.key});

  final String name;
  final String email;

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  

  int _isVisiblity = 0;

  void changeVis() {
    setState(() {
      if (_isVisiblity < 2) {
        _isVisiblity++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account detail'),
      ),
      body: Column(
        children: [
          ListBody(
            children: [
              if (_isVisiblity < 1)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Name : ${widget.name}"),
                      IconButton(
                          onPressed: changeVis,
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
              if (_isVisiblity < 2)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Email : ${widget.email}"),
                      IconButton(
                          onPressed: changeVis,
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            child: FilledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => EditPage(
                                name: widget.name,
                                email: widget.email,
                              )));
                },
                child: const Text('edit')),
          ),
        ],
      ),
    );
  }
}
