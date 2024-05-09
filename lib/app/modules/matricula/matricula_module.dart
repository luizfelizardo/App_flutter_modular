import 'package:biblioteca_modular/app/modules/matricula/matricula_page.dart';
import 'package:biblioteca_modular/app/shared/stores/curso_store.dart';
import 'package:biblioteca_modular/data/database_helper.dart';
import 'package:biblioteca_modular/repositories/database_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MatriculaModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DatabaseRepository(DatabaseHelper())),
    Bind((_) => CursoStore()),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => MatriculaPage(
            aluno: args.data,
          ),
        )
      ];
}
