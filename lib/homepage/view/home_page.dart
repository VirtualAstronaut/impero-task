import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:impero_task/homepage/bloc/home_page_bloc.dart';
import 'package:impero_task/homepage/view/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(onFilterTap: () {}, onSearchIcon: () {}),
      body: BlocProvider(
        create: (context) => HomePageBloc()..add(HomeDataFetched()),
        child: const _HomePageBody(),
      ),
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
    return BlocConsumer<HomePageBloc, HomePageState>(
      listener: onListen,
      builder: (context, state) {
        return switch (state) {
          SubcategoriesLoaded() => SubCatProductsList(
              category: state.subCategorydata.result?.category,
            ),
          SubcategoriesLoading() => const Loader(),
          SubcategoriesPaginationLoading() => SubCatProductsList(
              category: state.subCategorydata,
            ),
          HomePageInitial() => const SizedBox(),
          SubcategoriesFailed() => const SizedBox(),
        };
      },
    );
  }

  void onListen(BuildContext context, HomePageState state) {
    if (state is SubcategoriesFailed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'We Are Having Techincal Issues Please Try Again Later',
          ),
        ),
      );
    }
  }
}
