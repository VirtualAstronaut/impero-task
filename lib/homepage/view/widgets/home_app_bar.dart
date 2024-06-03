import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.onFilterTap,
    required this.onSearchIcon,
  });
  final VoidCallback onFilterTap;
  final VoidCallback onSearchIcon;

  static const titles = ['Ceramic', 'Porcelain', 'Woodeffect', 'Splash'];
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      actions: [
        IconButton(
          onPressed: onFilterTap,
          icon: const Icon(
            Icons.filter_alt_outlined,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: onSearchIcon,
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        )
      ],
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Row(
          children: [
            for (int i = 0; i < titles.length; i++)
              _Titles(
                text: titles[i],
                isSelected: i == 0,
              )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Titles extends StatelessWidget {
  const _Titles({super.key, required this.text, this.isSelected = false});
  final String text;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    const selectedStyle = TextStyle(color: Colors.white, fontSize: 20);
    const unSelectedStyle = TextStyle(color: Colors.grey, fontSize: 15);

    return Padding(
      padding: const EdgeInsets.only(
        right: 16.0,
      ),
      child: Text(
        text,
        style: isSelected ? selectedStyle : unSelectedStyle,
      ),
    );
  }
}
