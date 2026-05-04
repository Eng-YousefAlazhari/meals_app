import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dimmy_data.dart';

final mealsProvider = Provider(
  (ref) {
    return dummyMeals;
  },
);
