import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_start/model%20_class.dart';
import 'package:hive_start/screens/create_data.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_start/screens/edit_screen.dart';

class ShowDataScreen extends StatefulWidget {
  const ShowDataScreen({super.key});

  @override
  State<ShowDataScreen> createState() => _ShowDataScreenState();
}

class _ShowDataScreenState extends State<ShowDataScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    // Delete all data from hive
                    Hive.box('PersonBox').clear();
                  },
                  icon: Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.black,
                  )),
            ],
            backgroundColor: Colors.blue,
            title: const Text(
              "Show Data",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateData(),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
          body: FutureBuilder(
              future: Hive.openBox('PersonBox'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final hivebox = Hive.box('PersonBox');
                  return ValueListenableBuilder(
                    valueListenable: hivebox.listenable(),
                    builder: (context, Box box, child) {
                      if (box.isEmpty) {
                        return Center(
                          child: Text('No Data Found'),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: hivebox.length,
                            itemBuilder: (context, index) {
                              final helper =
                                  hivebox.getAt(index) as Model_Class;
                              return ListTile(
                                trailing: IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        useSafeArea: true,
                                        builder: (context) => AlertDialog(
                                              scrollable: true,
                                              title: Text(
                                                'Delete Confirmation',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              content: Text(
                                                'Are you sure you want to delete?',
                                              ),
                                              actions: [
                                                ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.red,
                                                    ),
                                                    onPressed: () {
                                                      hivebox.deleteAt(index);
                                                      print('Deleted');
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'Delete it',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child:
                                                        const Text('Return')),
                                              ],
                                            ));
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                                leading: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditScreen(
                                          index: index,
                                          name: helper.name,
                                          age: helper.age,
                                          phone: helper.phone,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.red,
                                  ),
                                ),
                                title: Text(helper.name),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Phone: " + helper.phone.toString()),
                                    Text("Age: " + helper.age.toString()),
                                  ],
                                ),
                              );
                            });
                      }
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ));
  }
}
