import 'package:flutter/material.dart';
import 'package:impero_task/homepage/view/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(onFilterTap: () {}, onSearchIcon: () {}),
      body: const _HomePageBody(),
    );
  }
}

class _HomePageBody extends StatefulWidget {
  const _HomePageBody({super.key});

  @override
  State<_HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<_HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
