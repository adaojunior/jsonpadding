// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'src/jsonp_call.dart';
import 'dart:async';

Future<dynamic> jsonp(dynamic uri, {String param}) =>
    new JsonpCall(uri, param: param).call();

class Jsonp {
  Future<dynamic> get(dynamic uri, {String param}) => jsonp(uri, param: param);
}
