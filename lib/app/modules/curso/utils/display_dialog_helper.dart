import 'package:biblioteca_modular/app/shared/stores/curso_store.dart';
import 'package:biblioteca_modular/models/curso.dart';
import 'package:biblioteca_modular/repositories/database_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DisplayDialogHelper {
  final CursoStore cursoStore = Modular.get<CursoStore>();
  final DatabaseRepository _databaseRepository =
      Modular.get<DatabaseRepository>();

  Future<void> displayInputDialogCurso(
      TextEditingController textDescricaoController,
      TextEditingController textEmentaController,
      BuildContext context,
      bool isUpdate,
      {Curso? cursoToEdit}) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: isUpdate
              ? const Text('Alterar livro')
              : const Text('Cadastre um livro'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: textDescricaoController,
                decoration: const InputDecoration(hintText: "Título"),
              ),
              TextField(
                controller: textEmentaController,
                decoration: const InputDecoration(hintText: "Autor"),
              ),
            ],
          ),
          actions: <Widget>[
            MaterialButton(
              color: Colors.white,
              textColor: Colors.black,
              child: const Text('CANCELAR'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            MaterialButton(
              color: Colors.white,
              textColor: Colors.black,
              child: const Text('OK'),
              onPressed: () {
                if (isUpdate) {
                  cursoToEdit!.descricao = textDescricaoController.text;
                  cursoToEdit.ementa = textEmentaController.text;
                  _databaseRepository.updateCurso(cursoToEdit).then((value) {
                    textDescricaoController.clear();
                    textEmentaController.clear();
                    cursoStore.fetchTodos();
                    Navigator.pop(context);
                  });
                } else {
                  Curso curso = Curso(
                      descricao: textDescricaoController.text,
                      ementa: textEmentaController.text);
                  _databaseRepository.insertCurso(curso).then((value) {
                    textDescricaoController.clear();
                    textEmentaController.clear();
                    cursoStore.fetchTodos();
                    Navigator.pop(context);
                  });
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> displayMatriculados(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Emprestado para: '),
          content: SizedBox(
            width: 400,
            height: 400,
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: cursoStore.listMatriculados.length,
              itemBuilder: (BuildContext context, int index) {
                final item = cursoStore.listMatriculados[index];
                return ListTile(
                  title: Text(
                    item,
                    style: const TextStyle(fontSize: 20),
                  ),
                  //leading: CircleAvatar(
                  //child: Text(
                  //'${item[0]}${item[1]}',
                  //style: const TextStyle(fontSize: 20),
                  //),
                  //),
                );
              },
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              color: Colors.white,
              textColor: Colors.black,
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
