/// an example of synchronous programme
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
  print('Doing it first');
}

void doThisSecond() {
  print('Doing it second');
}

void doThisThird() {
  print('Doing it third');
}
/**
 Doing it first
Doing it second
Doing it third
 * 
 */