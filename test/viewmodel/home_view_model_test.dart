import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/view_model/home_view_model.dart';

void main() {
  group('HomeViewModel Tests', () {
    late HomeViewModel homeViewModel;

    setUp(() {
      homeViewModel = HomeViewModel();
    });

    test('Initial counter value should be 0', () {
      expect(homeViewModel.count, 0);
    });

    test('Increment counter should increase count by 1', () {
      homeViewModel.incrementCount();
      expect(homeViewModel.count, 1);
    });

    test('Decrement counter should decrease count by 1', () {
      homeViewModel.incrementCount();
      homeViewModel.decrementCount();
      expect(homeViewModel.count, 0);
    });

    test('Multiple increments should increase count correctly', () {
      homeViewModel.incrementCount();
      homeViewModel.incrementCount();
      expect(homeViewModel.count, 2);
    });

    test('Multiple decrements should decrease count correctly', () {
      homeViewModel.incrementCount();
      homeViewModel.incrementCount();
      homeViewModel.decrementCount();
      expect(homeViewModel.count, 1);
    });
  });
}
