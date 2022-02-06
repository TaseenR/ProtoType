import 'dart:io';
import 'package:collection/collection.dart';

import 'package:tfl_api_client/tfl_api_client.dart';

Future<void> main() async {
  final client = clientViaAppKey('72831e817be542e394e9f328ffea5a68');

  final api = TflApiClient(client: client);

  for (var line in await api.lines.getByPathIds(['victoria'])) {
    print(line);
  }

  client.close();
}

Future<List<Place>> returnAll() {
  final client = clientViaAppKey('72831e817be542e394e9f328ffea5a68');
  TflApiClientContext z = TflApiClientContext(client: client);
  BikePointService x = BikePointService(context: z);
  Future<List<Place>> y = x.getAll();

  return y;
}
