import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'app_config.dart';

List<SingleChildWidget> appConfigProvider = <SingleChildWidget>[
  Provider<AppConfig>(
    create: (_) => AppConfigImpl(),
  ),
];
