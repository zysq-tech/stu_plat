import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AppProvider {
  static AppProvider _inst;
  AppProvider._();
  factory AppProvider() => _inst ??= AppProvider._();

  Widget initProvider({BuildContext context, Widget child}) {
    return MultiProvider(
      providers: [
        //TODO: ChangeNotifierProvider((_) => model())
      ],
      child: child,
    );
  }
}
