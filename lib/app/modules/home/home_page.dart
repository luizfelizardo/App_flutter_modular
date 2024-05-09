import 'package:biblioteca_modular/app/modules/home/utils/card_home_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BIBLIOTECA COMUNITÁRIA \nUNICEU ALVARENGA'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          CardHomePage(
            imageTilePath: 'assets/usuario.png',
            title: 'Pessoas Cadastradas',
            subtitle:
                'Inserções, alterações, exclusões de cadastro e reserva de livros',
            routePath: '/aluno/',
            acessarKey: 'acessar_aluno',
          ),
          SizedBox(
            height: 20,
          ),
          CardHomePage(
            imageTilePath: 'assets/curso.png',
            title: 'Acervo de livros',
            subtitle: 'Inserções, alterações e exclusões de livros',
            routePath: '/curso/',
            acessarKey: 'acessar_curso',
          ),
          SizedBox(
            height: 20,
          ),
          CardHomePage(
            imageTilePath: 'assets/1828407.png',
            title: 'Sair',
            subtitle: '',
            routePath: '/',
            acessarKey: 'acessar_curso',
          ),
        ]),
      ),
    );
  }
}
