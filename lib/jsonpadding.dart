// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:async';
import 'src/jsonp_call.dart';

Future<dynamic> jsonp(dynamic uri, {String param, Duration timeout}) =>
    new JsonpCall(uri, param: param, timeout: timeout).call();

class Jsonp {
  final String param;
  final Duration timeout;

  Jsonp({this.param, this.timeout});

  Future<dynamic> get(dynamic uri, {String param, Duration timeout}) =>
      jsonp(uri, param: param ?? this.param, timeout: timeout ?? this.timeout);
}
