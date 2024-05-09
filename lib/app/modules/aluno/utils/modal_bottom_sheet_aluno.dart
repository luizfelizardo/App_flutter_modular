import 'package:biblioteca_modular/app/modules/aluno/utils/display_input_dialog.dart';
import 'package:biblioteca_modular/app/shared/stores/aluno_store.dart';
import 'package:biblioteca_modular/models/aluno.dart';
import 'package:biblioteca_modular/repositories/database_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ModalBottomSheetAluno {
  final AlunoStore alunoStore = Modular.get<AlunoStore>();
  final DatabaseRepository _databaseRepository =
      Modular.get<DatabaseRepository>();

  Future<void> modalBottomSheetAluno(TextEditingController textNomeController,
      BuildContext context, Aluno item) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 210,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextButton(
                    child: const Text(
                      "Reservar livro",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      Modular.to.pushNamed('/matricula/', arguments: item);
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextButton(
                    child: const Text(
                      "Editar cadastro",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      textNomeController.text = item.nome;
                      DisplayInputDialog displayDialog = DisplayInputDialog();
                      displayDialog.displayTextInputDialog(
                          textNomeController, context, true,
                          alunoToEdit: item);
                      alunoStore.fetchTodos();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextButton(
                    child: const Text(
                      "Excluir cadastro",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      _databaseRepository.deleteAluno(item.codigo!);
                      alunoStore.fetchTodos();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
