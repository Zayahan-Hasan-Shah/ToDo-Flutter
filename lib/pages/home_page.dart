import 'package:flutter/material.dart';
import 'package:todo_app_flutter/utils/bucket_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List bucketList = [
    ['Learn Dart', false],
    ['Learn flutter', false],
    ['Do practice for 6 hours', false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      bucketList[index][1] = !bucketList[index][1];
    });
  }

  void saveNewTask(){
    setState(() {
      bucketList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index){
    setState(() {
      bucketList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 161, 106, 248),
      appBar: AppBar(
        title: const Center(child: Text('Bucket List')),
        backgroundColor: Colors.purple[200],
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: bucketList.length,
        itemBuilder: (BuildContext context, index) {
          return BucketList(
            taskName: bucketList[index][0],
            taskCompleted: bucketList[index][1],
            onChanged: (value) => checkBoxChanged(index),
            delteFunction: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: Row(
        children: [
           Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 32,
                right: 16,
                top: 12,
                bottom: 12,
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Add a new items to List',
                  filled: true,
                  fillColor: Colors.purple[200],
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(16)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(16)
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: saveNewTask,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
