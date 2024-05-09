import 'package:biblioteca_modular/data/database_helper.dart';
import 'package:biblioteca_modular/repositories/database_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/stores/aluno_store.dart';
import 'aluno_page.dart';

class AlunoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((_) => DatabaseRepository(DatabaseHelper())),
    Bind((_) => AlunoStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AlunoPage()),
  ];
}
