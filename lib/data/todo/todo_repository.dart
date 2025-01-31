import 'package:todo_app/domain/firebase/datastore/todo_api.dart';
import 'package:todo_app/domain/models/todo.dart';

class TodoRepository {
  final TodoApi todoApi;

  TodoRepository(this.todoApi);

  Future<bool> toggleDone(String id) async {
    return todoApi.toggleDone(
      id,
    );
  }

  Stream<List<Todo>> fetchTodos() {
    final source = todoApi.fetchTodos();
    return source.map(
      (event) => event.docs
          .map(
            (e) => Todo.fromMap(
              e.id,
              e.data(),
            ),
          )
          .toList(),
    );
  }
}
