// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_start/model%20_class.dart';

// class CreateData extends StatefulWidget {
//   const CreateData({super.key});

//   @override
//   State<CreateData> createState() => _CreateDataState();
// }

// class _CreateDataState extends State<CreateData> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _nameController.dispose();
//     _ageController.dispose();
//     _phoneController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: Icon(Icons.arrow_back_ios)),
//           backgroundColor: Colors.blue,
//           title: const Text(
//             "Create Data",
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   TextField(
//                     controller: _nameController,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Name',
//                     ),
//                   ),
//                   TextField(
//                     controller: _ageController,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Age',
//                     ),
//                   ),
//                   TextField(
//                       controller: _phoneController,
//                       decoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Phone',
//                       )),
//                   SizedBox(
//                     height: 25,
//                   ),
//                   ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue),
//                       onPressed: () {
//                         final value = Model_Class(
//                             name: _nameController.text,
//                             age: int.parse(_ageController.text),
//                             phone: int.parse(_phoneController.text));

//                         Hive.box('PersonBox').add(value);
//                         print('Create data');
//                         Navigator.pop(context);
//                       },
//                       child: const Text(
//                         "Create",
//                         style: TextStyle(color: Colors.white, fontSize: 20),
//                       ))
//                 ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
