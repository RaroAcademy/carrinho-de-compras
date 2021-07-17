import 'package:flutter/material.dart';

import 'controller.dart';

class StateBuilder<T> extends StatefulWidget {
  final Widget Function(BuildContext context, T state) builder;
  final Controller<T> controller;

  StateBuilder({Key? key, required this.builder, required this.controller})
      : super(key: key);

  @override
  _StateBuilderState<T> createState() => _StateBuilderState<T>();
}

class _StateBuilderState<T> extends State<StateBuilder<T>> {
  @override
  void initState() {
    widget.controller.listen((_) => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.controller.state);
  }
}
