import 'package:flutter/material.dart';
import 'package:login_signup/widgets/card_widget.dart';

class PencatatanPage extends StatefulWidget {
  @override
  _PencatatanPageState createState() => _PencatatanPageState();
}

class _PencatatanPageState extends State<PencatatanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Halaman Pencatatan",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 0), 
            CardWidget(
              title: 'Pencatatan',
              icon: Icons.note_add_outlined,
              color: Colors.orange,
            ),
            SizedBox(height: 5),
            CardWidget(
              title: 'Perawatan',
              icon: Icons.water_drop_outlined,
              color: Colors.green,
            ),
            SizedBox(height: 5),
            CardWidget(
              key: UniqueKey(), 
              title: 'Panen',
              icon: Icons.coffee_maker,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}


  