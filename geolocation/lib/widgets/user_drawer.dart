import 'package:flutter/material.dart';
import 'package:geolocation/screens/userDetailsScreen.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        AppBar(
          title: Text('Hello User,'),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        SizedBox(
          height: 3,
        ),
        ListTile(
          title: Text("Home"),
          leading: Icon(Icons.home),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        addDrawerList(Icon(Icons.person_pin), 'Profile', UserDetails.routeName, context),
        addDrawerList(
            Icon(Icons.border_color), 'Change Password', '/', context),
        // addDrawerList(Icon(Icons.keyboard_backspace), 'Logout', '/', context),
        ListTile(
          title: Text("Logout"),
          leading: Icon(Icons.keyboard_backspace),
          onTap: () {
            // Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed('/');
            Provider.of<Auth>(context, listen: false).logout();
          },
        ),
      ],
    ));
  }

  ListTile addDrawerList(Icon icon, String title, navroute, context) {
    return ListTile(
      title: Text(title),
      leading: icon,
      onTap: () {
        Navigator.of(context).pushNamed(navroute);
      },
    );
  }
}
