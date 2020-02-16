import 'package:flutter_fashion_collective/app_config/app_config.dart';
import 'package:flutter_fashion_collective/net/client.dart';
import 'package:flutter_fashion_collective/net/http_client.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> netProvider = <SingleChildWidget>[
  ProxyProvider<AppConfig, Client>(
    create: (_) => null,
    update: (_, AppConfig appConfig, Client previous) {
      if (previous == null && appConfig != null) {
        return HttpClient(
          appConfig: appConfig,
        );
      } else {
        return previous;
      }
    },
  ),
];
