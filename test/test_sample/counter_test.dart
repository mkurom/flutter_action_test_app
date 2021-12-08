import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_action_test_app/test_sample/counter.dart';

void main() {
  // 単体のテストはtest関数を使用する
  test('Counter value should be incremented', () {
    final counter = Counter();

    counter.increment();

    // 第一引数と第二引数の値が等しいかのテスト
    expect(counter.value, 1);
  });

  // 複数のテストの時にgroup関数を使用する
  group('Counter', () {
    test('value should start at 0', () {
      expect(Counter().value, 0);
    });

    test('value should be incremented', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    test('value should be decremented', () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });
}
