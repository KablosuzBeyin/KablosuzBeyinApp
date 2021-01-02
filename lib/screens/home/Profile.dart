import 'package:flutter/material.dart';
import 'package:kablosuzbeyin/authentication/AuthService.dart';

class Profile extends StatelessWidget {
  
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 3.0,
        title: Text("Profil"),
        actions: [
          IconButton(
            onPressed: () async {
              //
              showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      color: Colors.white,
                      child: new Wrap(
                        children: <Widget>[
                          new ListTile(
                            leading: new Icon(Icons.settings_applications),
                            title: new Text('Ayarlar'),
                            onTap: () => {},
                          ),
                          new ListTile(
                            leading: new Icon(Icons.notifications),
                            title: new Text('Bildirim Ayarları'),
                            onTap: () => {},
                          ),
                          new ListTile(
                              leading: new Icon(Icons.person),
                              title: new Text('Çıkış Yap'),
                              onTap: () async {
                                await _auth.signOut();
                              }),
                        ],
                      ),
                    );
                  });
            },
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: Container(
        child: Text("Profil"),
      ),
    );
  }
}
