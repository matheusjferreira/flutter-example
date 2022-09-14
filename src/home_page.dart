import 'package:example/home_controller.dart';
import 'package:example/home_model.dart';
import 'package:example/home_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // controller -> variável do tipo HomeController, que nos permitirá acessar a classe HomeController.
  final _controller = HomeController(HomeRepository());
  // _homeModel -> variável do tipo HomeModel, para ser populada de dados vindos da api.
  HomeModel? _homeModel;
  // _isLoading -> variável do tipo bool, que servirá para dizer se a página está carrega ou não.
  bool _isLoading = false;

  // loadData() async -> Função assíncrona que acessará a função "loadData" em HomeController, que por sua vez
  // irá acessar a função "getData" em HomeReposiory, retornando um HomeModel com dados da api.
  _loadData() async {
    _homeModel = await _controller.loadData();
    // Future.delayed() -> Função para atrasar 3 segundos antes de mostrar os dados na tela.
    // setState(() {}) -> Função que mudará o estado da página, removendo o Widget CircularProgressIndicator e renderizando o Widget Column
    // e mudando os valores das variáveis "_homeModel" e "_isLoading".
    Future.delayed(const Duration(seconds: 3)).then((value) => setState(() {
          _isLoading = true;
        }));
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    // SafeArea -> Um widget que insere seu filho com preenchimento suficiente para evitar intrusões por o sistema operacional.
    return SafeArea(
      // Scaffold -> Implementa a estrutura básica de layout visual do Material Design.
      child: Scaffold(
        // AppBar -> Widget que fica na parte superior do aplicativo, pode-se colocar Widgets (imagens, textos, botões...).
        appBar: AppBar(title: const Text('Example app')),

        // body -> Corpo da página onde será exibido os dados carregados da api.
        body: Padding(
          // Padding -> Widget usado para por margim.
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          // isLoading -> Enquanto os dados não cerregam será exibido um CircularProgressIndicator.
          child: !_isLoading
              ? const Center(child: CircularProgressIndicator())
              // HomeBodyWidget -> Widget do tipo StatelessWidget, criado para desacoplar o código.
              : HomeBodyWidget(
                  userId: _homeModel!.userId!,
                  id: _homeModel!.id!,
                  title: _homeModel!.title!,
                  completed: _homeModel!.completed!,
                ),
        ),
      ),
    );
  }
}

class HomeBodyWidget extends StatelessWidget {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const HomeBodyWidget({
    super.key,
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    // Column -> Widget usado para empilhar Widgets.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text -> Usado para por escrever Textos.
        Text('User ID: $userId}'),
        // SizedBox -> Usado para por espaços entre Widgets.
        const SizedBox(height: 16),
        Text('ID: $id'),
        const SizedBox(height: 16),
        Text('Title: $title'),
        const SizedBox(height: 16),
        Text('Completed: $completed'),
      ],
    );
  }
}
