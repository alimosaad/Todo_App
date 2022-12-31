import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/models/tasks.dart';

CollectionReference<TaskData> getCollection() {
  return FirebaseFirestore.instance.collection('tasks').withConverter<TaskData>(
      fromFirestore: (snapshot, options) => TaskData.fromJson(snapshot.data()!),
      toFirestore: (task, option) => task.toJson());
}

Future<void> addTaskToFirebase(TaskData taskData) {
  var collection = getCollection();
  var documentRefrence = collection.doc();
  taskData.id = documentRefrence.id;
  return documentRefrence.set(taskData);
}
