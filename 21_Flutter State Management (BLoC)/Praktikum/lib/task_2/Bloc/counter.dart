import 'dart:async';

import 'dart:developer';

class CounterBloc {
  int _counter = 0;

  int get counter => _counter;

  StreamController _inputController = StreamController();
  StreamSink get inputan => _inputController.sink;
  StreamController _outputController = StreamController();
  StreamSink get _sinkOut => _outputController.sink;
  Stream get output => _outputController.stream;

  CounterBloc() {
    _inputController.stream.listen(
      (event) {
        if (event == "Tambah") {
          _counter++;
        } else {
          _counter--;
        }

        _sinkOut.add(_counter);
      },
    );
  }
  void dispose() {
    _inputController.close();
    _outputController.close();
  }
}
