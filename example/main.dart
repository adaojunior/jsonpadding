import 'package:jsonpadding/jsonpadding.dart';

main() {
  /// uri could also be an [String]
  Uri uri = new Uri(
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
  new Jsonp()..get(uri).then(print, onError: print);
}
