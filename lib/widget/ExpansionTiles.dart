import 'package:flutter/material.dart';

class ExpansionTiles extends StatelessWidget {
  const ExpansionTiles({
    Key? key, required this.tiitle, required this.subtitle, required this.init,
  }) : super(key: key);

  final String tiitle ;
  final String subtitle;
  final bool init ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ExpansionTile(
        initiallyExpanded: init,
        children: [
          ListTile(
            title: Text(subtitle),
          )
        ],
        title: Text(
          tiitle,
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
