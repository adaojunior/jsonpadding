// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:html';
import 'dart:js';
import 'dart:async';

class Jsonp {
  static int _i = 0;

  Future<dynamic> get(dynamic uri) async {
    Completer completer = new Completer();
    uri = _createUri(uri);
    String callback = uri.queryParameters['callback'];
    context[callback] = completer.complete;
    ScriptElement script = new ScriptElement();
    script.src = uri.toString();
    document.body.append(script);
    final response = await completer.future;
    script.remove();
    context.deleteProperty(callback);
    return response;
  }

  Uri _createUri(dynamic uri) {
    if (!(uri is Uri)) {
      uri = Uri.parse(uri);
    }

    Map parameters = new Map.from(uri.queryParameters);
    String callback = _id();
    parameters['callback'] = callback;
    uri = uri.replace(queryParameters: parameters);
    return uri;
  }

  _id() => '__dart_jsonp__req__${_i++}';
}

Future<dynamic> jsonp(dynamic uri) => new Jsonp().get(uri);
