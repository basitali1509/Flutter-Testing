import 'package:flutter_test/flutter_test.dart';
import 'package:testing/counter.dart';


void main(){
  late Counter  counter;
  setUp((){
    counter = Counter();
  });


  
  group('Counter Class - ', () {
    test('given counter class when it is instantiated then value of count should be 0', () {
      //arrange
      // Counter  counter = Counter();
      // act
      final val = counter.count;
      // assert
      expect(val, 0);
    });
    test('given counter class when it is incremented then value of count should be 1', () {
      //arrange
      // Counter  counter = Counter();
      counter.incrementCounter();
      // act
      final val = counter.count;
      // assert
      expect(val, 1);
    });
    test('given counter class when it is decremented then value of count should be -1', () {
      //arrange
      // Counter  counter = Counter();
      counter.decrementCounter();
      // act
      final val = counter.count;
      // assert
      expect(val, -1);
    });
    test('given counter class when it is reset then value of count should be 0', () {
      //arrange
      // Counter  counter = Counter();
      counter.resetCounter();
      // act
      final val = counter.count;
      // assert
      expect(val, 0);
    });

  });
}