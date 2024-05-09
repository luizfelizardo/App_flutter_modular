import 'package:biblioteca_modular/app/modules/curso/curso_page.dart';
import 'package:biblioteca_modular/app/shared/stores/curso_store.dart';
import 'package:biblioteca_modular/data/database_helper.dart';
import 'package:biblioteca_modular/repositories/database_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CursoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((_) => DatabaseRepository(DatabaseHelper())),
    Bind((_) => CursoStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => CursoPage()),
  ];
}
