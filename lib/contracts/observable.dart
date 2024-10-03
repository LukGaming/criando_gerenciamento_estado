abstract class Observable {
  void addListener(void Function() callback);
  void removeListener(void Function() callback);
}
