// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:async';
import 'dart:html';
import 'dart:js';

int _requestId = 0;

_createId() => '__dart_jsonp__req__${_requestId++}';

class JsonpCall {
  final ScriptElement script = new ScriptElement();
  final String callback = _createId();
  Uri uri;
  String _param = 'callback';
  final Duration timeout;
  Timer _timer;

  JsonpCall(dynamic uri, {String param, this.timeout}) {
    _param = param ?? _param;
    this.uri = _createUri(uri, callback);
  }

  bool get hasTimeout => timeout != null;

  Future<dynamic> call() {
    Completer completer = new Completer();
    context[callback] = completer.complete;
    script.src = uri.toString();
    script.onError.listen((_) {
      completer.completeError('Failed to load $uri');
    });

    document.body.append(script);

    if (hasTimeout) {
      _timer = new Timer(timeout,
          () => completer.completeError(new TimeoutException(null, timeout)));
    }

    return completer.future.whenComplete(_cleanup);
  }

  void _cleanup() {
    _timer?.cancel();
    script.remove();
    context.deleteProperty(callback);
  }

  Uri _createUri(dynamic uri, String callback) {
    uri = (uri is Uri) ? uri : Uri.parse(uri);
    Map parameters = new Map.from(uri.queryParameters);
    parameters[_param] = callback;
    return uri.replace(queryParameters: parameters);
  }
}
