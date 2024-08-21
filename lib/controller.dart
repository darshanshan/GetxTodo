import 'package:get/get.dart';
import 'package:getxtodo/todo_model.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  void addTodo(Todo todo) {
    todos.add(todo);
  }

  void deleteTodo(int index) {
    todos.removeAt(index);
  }
}
