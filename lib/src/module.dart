import 'package:darto/darto.dart';

import 'injector.dart';

final inject = Injector.instance;

abstract class DartoModule {
  // Método público que já fornece o Injector pronto
  void configureRoutes(Router router) => onConfigureRoutes(router, inject);

  // Método público que já fornece o Injector pronto
  void binds() => onBinds(inject);

  // Subclasses implementam esses dois
  void onConfigureRoutes(Router router, Injector i);
  void onBinds(Injector i);

  void init(Router router) {
    binds();
    configureRoutes(router);
  }
}
