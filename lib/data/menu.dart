import 'package:flutter/material.dart';

class Menu {
  final String item;
  final IconData icon;

  const Menu({this.item, this.icon});
}

const List<Menu> menu = <Menu>[
  Menu(item: "Rizal"),
  Menu(item: "Dashboard", icon: Icons.arrow_right_rounded),
  Menu(item: "Profile", icon: Icons.arrow_right_rounded),
  Menu(item: "Logout", icon: Icons.arrow_right_rounded),
];
