import 'package:flutter/material.dart';

class CategoriaListItem extends StatelessWidget {
  const CategoriaListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.amber,
        child: Icon(
          Icons.home,
          size: 20,
          color: Colors.white,
        ),
      ),
      title: Text("Mercado"),
      trailing: Text(
        'Despesa',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          color: Colors.pink,
        ),
      ),
    );
  }
}
