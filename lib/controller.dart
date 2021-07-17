class Controller<T> {
  T state;
  Function(T)? _listeners;
  Controller(
    this.state,
  );

  void listen(Function(T) listener) {
    _listeners = listener;
  }

  void update(T newState) {
    this.state = newState;
    if (_listeners != null) {
      _listeners!(this.state);
    }
  }
}
