import 'package:flutter/material.dart';
import 'package:mealsapp/model/item_catagory.dart';

class CatagoryGridItem extends StatelessWidget {
  const CatagoryGridItem(
      {super.key, required this.catagory, required this.onSelectedCatagory});

  final ItemsCatagory catagory;
  final void Function() onSelectedCatagory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onSelectedCatagory();
        },
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                catagory.color.withOpacity(0.9),
                catagory.color.withOpacity(0.55)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(16)),
          child: Text(catagory.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground)),
        ));
  }
}
