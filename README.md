# jsonpadding

A jsonp library for Dart.

## Usage

A simple usage example:

```dart
import 'package:jsonpadding/jsonpadding.dart';

void main() {

  /// uri could also be a [String]
  Uri uri = Uri(
      scheme: 'http',
      host: 'en.wikipedia.org',
      path: 'w/api.php',
      queryParameters: {
        'search': 'brazil',
        'action': 'opensearch',
        'format': 'json'
      }
  );

  jsonp(uri).then(print);

  /// Also available as a class
  Jsonp()..get(uri).then(print);
}
```
