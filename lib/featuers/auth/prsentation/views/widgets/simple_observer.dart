import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('onChange: $change');
  }

  @override
  void onClose(BlocBase bloc) {
    log('onClose: $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    log('onCreate: $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError: $bloc');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log('onEvent: $bloc');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('onTransition: $bloc');
  }
}
