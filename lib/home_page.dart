import 'package:flutter/material.dart';

import 'home_controller.dart';
import 'home_model.dart';
import 'home_repository.dart';
import 'widgets/home_body_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController(HomeRepository());

  HomeModel? _homeModel;

  bool _isLoading = false;

  _loadData() async {
    _homeModel = await _controller.loadData();

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Example app')),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          child: !_isLoading
              ? const Center(child: CircularProgressIndicator())
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
