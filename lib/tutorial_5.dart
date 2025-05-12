import 'dart:math';
import 'dart:async';

Future<String> fetchUserOrder() {
  // Simulate a delay and return a mock order
  return Future.delayed(
    Duration(seconds: Random().nextInt(5)),
        () => 'Large Latte with sugar',
  );
}

Future<String> createOrderMessage() async {
  var order = await fetchUserOrder();
  return 'Your order is: $order';
}

Future<void> getLatte() async {
  final seconds_delay = Random().nextInt(5);
  // Simulate a delay and then print
  return Future.delayed(
      Duration(seconds: seconds_delay),
  () => print('Latte ready in $seconds_delay seconds'));
}

Future<void> getSugar() async {
  final seconds_delay = Random().nextInt(5);
  // Simulate a delay and then print
  return Future.delayed(
    Duration(seconds: seconds_delay),
        () => print('Sugar taken in $seconds_delay seconds'),
  );
}

Future<void> main() async {
  print('Fetching user order...');
// Run both getLatte and getSugar in parallel
  await Future.wait([
    getLatte(),
    getSugar(),
  ]);
  print(await createOrderMessage());
}