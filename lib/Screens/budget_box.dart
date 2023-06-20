import 'package:hive/hive.dart';

class BudgetBox {
  static const String boxName = 'budgetBox';

  static const String budgetLimitKey = 'budgetLimit';
  static const String remainingBudgetKey = 'remainingBudget';

  static Future<void> init() async {
    await Hive.openBox(boxName);
  }

  static Box getBox() {
    return Hive.box(boxName);
  }

  static double getBudgetLimit() {
    final box = getBox();
    return box.get(budgetLimitKey, defaultValue: 500.0);
  }

  static double getRemainingBudget() {
    final box = getBox();
    return box.get(remainingBudgetKey, defaultValue: 350.0);
  }

  static Future<void> setBudgetLimit(double budgetLimit) async {
    final box = getBox();
    await box.put(budgetLimitKey, budgetLimit);
  }

  static Future<void> setRemainingBudget(double remainingBudget) async {
    final box = getBox();
    await box.put(remainingBudgetKey, remainingBudget);
  }
}
