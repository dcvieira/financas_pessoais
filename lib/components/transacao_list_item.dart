import 'package:flutter/material.dart';

class TransacaoListItem extends StatelessWidget {
  const TransacaoListItem({Key? key}) : super(key: key);

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
      title: Text("Compras no Mercado"),
      subtitle: Text('17/07/2022'),
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
