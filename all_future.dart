void main() {
  performAnotherHevyTaskWithThen();
  performAHevyTaskWithAsyncAndAwait();
  print('main thread starts....');
  print('main thread ends....');
}

void performAnotherHevyTaskWithThen() {
  Future<String> result = getWeatherDataUsingAnotherAPI();
  result.then((value) {
    print('The content of the file with Future then - $value');
  });
}

Future<String> getWeatherDataUsingAnotherAPI() {
  Future<String> result = Future.delayed(const Duration(seconds: 8), () {
    return 'Downloading File completed after 8 seconds.';
  });
  return result;
}

void performAHevyTaskWithAsyncAndAwait() async {
  String result = await getWeatherDataUsingAnAPI();
  print('The content of the file with Future, async and await - $result');
}

Future<String> getWeatherDataUsingAnAPI() {
  Future<String> result = Future.delayed(const Duration(seconds: 6), () {
    return 'Downloading File completed after 6 seconds.';
  });
  return result;
}

/**
 
main thread starts....
main thread ends....
The content of the file with Future, async and await - Downloading File completed after 6 seconds.
The content of the file with Future then - Downloading File completed after 8 seconds.

 * 
 * 
 */