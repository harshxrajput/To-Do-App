import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class addtodo extends StatefulWidget {
  void Function({required String todoText}) addTodo;
  addtodo({super.key,required this.addTodo});

  @override
  State<addtodo> createState() => _addtodoState();
}

class _addtodoState extends State<addtodo> {
  TextEditingController todoText=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text('Add to-do',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            TextField(
              autofocus: true,
              controller: todoText,
              onSubmitted: (value) {
                if (todoText.text.isNotEmpty) {
                  widget.addTodo(todoText: todoText.text);
                }
                todoText.text = '';
              },
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade800), // Line color when focused
                ),
              ),
            ),

            ElevatedButton(onPressed: (){
              if(todoText.text.isNotEmpty){
                widget.addTodo(todoText: todoText.text);
              }
              todoText.text='';
            },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade800),
                child: Text('add',style: TextStyle(fontSize: 18,color: Colors.white), ))
          ],
        ),
      ),
    );
  }
}
