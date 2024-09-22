import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_start/model%20_class.dart';

class EditScreen extends StatefulWidget {
  const EditScreen(
      {super.key,
      required this.name,
      required this.age,
      required this.phone,
      required this.index});
  final String name;
  final int age;
  final int phone;
  final int index;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _agecontroller = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();

  @override
  void initState() {
    _namecontroller.text = widget.name;
    _agecontroller.text = widget.age.toString();
    _phonecontroller.text = widget.phone.toString();
    super.initState();
  }

  @override
  void dispose() {
    _namecontroller.dispose();
    _agecontroller.dispose();
    _phonecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
          backgroundColor: Colors.blue,
          title: const Text(
            "Edit Data",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              TextField(
                controller: _namecontroller,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: _agecontroller,
                decoration: const InputDecoration(
                  labelText: 'Age',
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                  controller: _phonecontroller,
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                  )),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    final value = Model_Class(
                      name: _namecontroller.text,
                      age: int.parse(_agecontroller.text),
                      phone: int.parse(
                        _phonecontroller.text,
                      ),
                    );
                    Hive.box('PersonBox').put(widget.index, value);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Update',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
