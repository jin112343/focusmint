import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:focusmint/services/speed_score_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('history accepts integer JSON values and preserves them when adding a score', () async {
    final now = DateTime.now();
    final day =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
    final month = day.substring(0, 7);
    SharedPreferences.setMockInitialValues({
      'daily_history': jsonEncode({day: 12}),
      'monthly_history': jsonEncode({month: 12}),
    });
    final service = SpeedScoreService();
    expect((await service.getWeeklyHistory())[day], 12);
    expect((await service.getMonthlyHistory())[month], 12);
    await service.addTotalScore(6.0);
    expect((await service.getWeeklyHistory())[day], 18);
    expect((await service.getMonthlyHistory())[month], 18);
  });
}
