/// an example of asynchronous programme
///

void main() {
  callEveryTask();
}

void callEveryTask() {
  doThisFirst();
  doThisSecond();
  doThisThird();
}

void doThisFirst() {
  String result = 'First task completed.';
  print('Doing it first');
}

String doThisSecond() {
  String result = 'Second task completed.';
  Duration duration = const Duration(seconds: 2);
  Future.delayed(duration, () {
    print('Doing it second');
    result;
  });
  return result;
}

void doThisThird() {
  String result = 'Third task completed.';
  print('Doing it third');
}
/**
Doing it first
Doing it third
Doing it second
 * 
 */