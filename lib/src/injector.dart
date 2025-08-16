import 'package:injectfy/injectfy.dart';

abstract class Injector implements Injectfy {
  static get instance => Injectfy.I;
}
