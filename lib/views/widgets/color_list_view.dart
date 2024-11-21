import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ?  CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: color,
            ),
          )
        :  CircleAvatar(
            radius: 38,
            backgroundColor:color,
          );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;
  List<Color> colors=const[
    Color(0xffff1053),
    Color(0xff6c6ea0),
    Color(0xff66C7F4),
    Color(0xffc1cad6),
    Color(0xffFFFFFF),
  
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: InkWell(
                onTap: () {
                  // to change color he choose
                  setState(() {
                    currentIndex = index;
                  });
                },
                child: ColorItem(
                  // check which one is selcet or active
                  isActive: currentIndex == index,
                  color: colors[index],
                ),
              ),
            );
          }),
    );
  }
}
