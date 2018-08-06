import 'package:jsonpadding/jsonpadding.dart';

main() {
  /// uri could also be an [String]
  Uri uri = Uri(
      scheme: 'http',
      host: 'en.wikipedia.org',
      path: 'w/api.php',
      queryParameters: {
        'search': 'brazil',
        'action': 'opensearch',
        'format': 'json'
      });

  jsonp(uri).then(print, onError: print);

  /// Also available as a class
  Jsonp()..get(uri).then(print, onError: print);
}
