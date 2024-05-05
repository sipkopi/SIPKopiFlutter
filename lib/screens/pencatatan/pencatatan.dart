import 'package:flutter/material.dart';
import 'package:login_signup/widgets/card_widget.dart';
import 'package:login_signup/screens/pencatatan/pembibitan/pembibitan.dart';
import 'package:login_signup/screens/pencatatan/perawatan/perawatan.dart';
import 'package:login_signup/screens/pencatatan/panen/panen.dart';


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
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PembibitanPage()),
                  );
                },
                child: SizedBox(
                  width: 350,
                  height: 130,
                  child: CardWidget(
                    image: AssetImage('assets/images/pembibitan.png'),
                  ),
                ),
              ),
              SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PerawatanPage()),
                  );
                },
                child: SizedBox(
                  width: 350,
                  height: 130,
                  child: CardWidget(
                    image: AssetImage('assets/images/perawatan.png'),
                  ),
                ),
              ),
              SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PanenPage()),
                  );
                },
                child: SizedBox(
                  width: 350,
                  height: 130,
                  child: CardWidget(
                    image: AssetImage('assets/images/panen.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
