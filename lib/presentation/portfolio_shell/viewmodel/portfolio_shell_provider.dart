import 'package:flutter_riverpod/flutter_riverpod.dart';

final portfolioNavIndexProvider = NotifierProvider<PortfolioNavNotifier, int>(() {
  return PortfolioNavNotifier();
});

class PortfolioNavNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void setIndex(int index) {
    state = index;
  }
}
