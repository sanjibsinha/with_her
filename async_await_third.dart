/// an example of asynchronous programme
/// the third task completed before the second task
///

void main() {
  callEveryTask();
}

void callEveryTask() async {
  doThisFirst();
  String secondTask = await doThisSecond();
  doThisThird(secondTask);
}

void doThisFirst() {
  String result = 'First task completed.';
  print('Doing it first');
}

Future doThisSecond() async {
  String result = '..second task completed..';
  Duration duration = const Duration(seconds: 2);
  await Future.delayed(duration, () {
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
Doing it second
Doing it third with ..second task completed..
 * 
 */
