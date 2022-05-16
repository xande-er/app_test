import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Server {
  static const url = 'https://api.unsplash.com/';

  static const seconds = 7;

  var headers = {'Content-Type': 'application/json'};

  request(path, {req = 'POST'}) => ((http.Request(req, Uri.parse('$url$path')))..headers.addAll(headers));

  Future viewAllPhoto({required int page, required BuildContext c}) async => await json.decode((await (await ((request(
                  'photos?page=$page&per_page=20&client_id=896d4f52c589547b2134bd75ed48742db637fa51810b49b607e37e46ab2c0043',
                  req: 'GET')))
              .send())
          .stream
          .bytesToString())
      .toString());
}
