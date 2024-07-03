import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class Observer extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log(change.toString(), level: 2, name: 'ON CHANGE');
    super.onChange(bloc, change);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log(event.toString(), level: 2, name: 'ON EVENT');
    super.onEvent(bloc, event);
  }
}
