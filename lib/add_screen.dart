import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtodo/controller.dart';
import 'package:getxtodo/todo_model.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});
  final TodoController controller = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          TextField(
            controller: textEditingController,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                controller.addTodo(Todo(
                    description: 'No.3 Description',
                    title: textEditingController.text));
                textEditingController.clear();
              },
              child: const Text('Add')),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Obx(
            () => ListView.builder(
              itemCount: controller.todos.length,
              itemBuilder: (context, index) => ListTile(
                trailing: IconButton(
                    onPressed: () {
                      controller.deleteTodo(index);
                    },
                    icon: const Icon(Icons.delete)),
                title: Text(controller.todos[index].title),
                subtitle: Text(controller.todos[index].description),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
