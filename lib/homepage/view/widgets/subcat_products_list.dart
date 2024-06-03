import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:impero_task/homepage/bloc/home_page_bloc.dart';

import 'package:impero_task/homepage/models/subcategory_model.dart';

class SubCatProductsList extends StatefulWidget {
  const SubCatProductsList({super.key, this.category});
  final List<Category>? category;

  @override
  State<SubCatProductsList> createState() => _SubCatProductsListState();
}

class _SubCatProductsListState extends State<SubCatProductsList>
    with AutomaticKeepAliveClientMixin {
  ScrollController controller = ScrollController();
  bool initialCall = true;

  @override
  void initState() {
    blocked();
    super.initState();
  }

  void blocked() {
    final bloc = context.read<HomePageBloc>();
    bloc.add(HomeDataPaginatedFetched(widget.category));
    initialCall = false;
  }

  // void paginationController() {
  //   final bloc = context.read<HomePageBloc>();
  //   if (controller.position.maxScrollExtent != controller.offset) {
  //     return;
  //   }
  //   bloc.add(HomeDataPaginatedFetched(widget.category));
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final data = widget.category?.firstOrNull?.subCategories;
    if (data?.isEmpty ?? true) {
      return const Center(
        child: Text('No Data'),
      );
    }

    return ListView.builder(
      itemCount: data?.length ?? 0,
      controller: controller,
      padding: const EdgeInsets.only(
        left: 16,
        top: 16,
      ),
      itemBuilder: (context, index) {
        return _ProductList(data: data![index]);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _ProductList extends StatelessWidget {
  const _ProductList({
    super.key,
    required this.data,
  });
  final SubCategory? data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data?.name ?? '',
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: data?.product?.length ?? 0,
            itemBuilder: (context, index) {
              final item = data?.product![index];
              return _TileWidget(item: item);
            },
          ),
        )
      ],
    );
  }
}

class _TileWidget extends StatelessWidget {
  const _TileWidget({super.key, this.item});
  final Product? item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            if (item?.imageName?.isNotEmpty ?? false)
              Image.network(
                item!.imageName!,
                fit: BoxFit.fill,
                height: 90,
                width: 90,
              ),
            if (item?.priceCode?.isNotEmpty ?? false)
              Positioned(
                left: 5,
                top: 5,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.blue,
                  ),
                  child: Text(
                    item!.priceCode!,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
