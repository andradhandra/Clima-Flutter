import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async  {
  task1();
  String data = await task2();
  task3(data);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future task2() async  {
  String result;
  Duration delay = Duration(seconds: 5);
  await Future.delayed(delay, () {
    result = "Task 2 data";
    print("Task 2 is complete");
  });
  return result;
}

void task3(String data) {
  String result = 'task 3 data';
  print('Task 3 complete with $data');
}