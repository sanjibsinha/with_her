/// an example of asynchronous programme
/// the third task completed before the second task
///

void main() {
  callEveryTask();
}

void callEveryTask() {
  doThisFirst();
  String secondTask = doThisSecond();
  doThisThird(secondTask);
}

void doThisFirst() {
  String result = 'First task completed.';
  print('Doing it first');
}

String doThisSecond() {
  String result = 'Untill 2 seconds it\'s null';
  Duration duration = const Duration(seconds: 2);
  Future.delayed(duration, () {
    result;

    print('Doing it second');
  });
  return result.toString();
}

void doThisThird(String secondTask) {
  String result = 'Third task completed.';
  print('Doing it third with $secondTask');
}
/**
Doing it first
Doing it third with Untill 2 seconds it's null
Doing it second
 * 
 */
