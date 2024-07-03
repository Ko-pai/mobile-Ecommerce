import 'package:flutter/material.dart';
import 'package:testp/firstApp/my_page.dart';

class CreateInputPage extends StatefulWidget {
  const CreateInputPage({super.key});

  @override
  State<CreateInputPage> createState() => _CreateInputPageState();
}

class _CreateInputPageState extends State<CreateInputPage> {
  var _namecontroller = TextEditingController();
  var _emailcontroller = TextEditingController();
  String name = "";
  String email = "";

  late bool isButtonEnabled;

  @override
  void dispose() {
    _namecontroller.dispose();
    _emailcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: 80,
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: TextField(
            controller: _namecontroller,
            decoration: InputDecoration(
                hintText: "Name",
                labelText: "Name",
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                prefixIcon: const Icon(
                  Icons.contact_page,
                  color: Colors.deepPurple,
                ),
                suffixIcon: TextButton(
                    onPressed: () {
                      setState(() {
                        _namecontroller = TextEditingController(text: '');
                      });
                    },
                    child: const Icon(Icons.backspace_outlined))),
            onChanged: (value) => setState(() {
              name = value;
            }),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.only(left: 25, right: 25),
          height: 200,
          child: TextField(
            controller: _emailcontroller,
            decoration: InputDecoration(
                hintText: "Email",
                labelText: "Email",
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.deepPurple,
                ),
                suffixIcon: TextButton(
                    onPressed: () {
                      setState(() {
                        _emailcontroller = TextEditingController(text: '');
                      });
                    },
                    child: const Icon(Icons.backspace_outlined))),
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
          ),
        ),
        Container(
            padding: const EdgeInsets.all(25),
            width: double.infinity,
            child: CreateButton(
              name: name,
              email: email,
            )),
      ],
    );
  }
}

class CreateButton extends StatelessWidget {
  const CreateButton({required this.name, required this.email, super.key});

  final String name;
  final String email;

  void gotoMypage(context) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => MyPage(
          name: name,
          email: email,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: FilledButton.styleFrom(maximumSize: Size.infinite),
        onPressed: () {
          gotoMypage(context);
        },
        child: const Text("Create"));
  }
}
