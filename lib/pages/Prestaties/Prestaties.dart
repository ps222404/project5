import 'package:flutter/material.dart';
import 'package:project5mobile/pages/about_us/aboutUs.dart';
import 'package:project5mobile/service/PrestatieService.dart';
import 'package:project5mobile/models/Prestatie.dart';
import 'package:project5mobile/models/Oefening.dart';
import 'package:project5mobile/service/Oefeningenservice.dart';

class Prestaties extends StatelessWidget {
  const Prestaties({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 100.0),
              child: Text('Mijn App'),
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsPage()),
                );
              },
            ),
          ],
        title: const Text('Prestaties Index'),
        backgroundColor: Color.fromRGBO(15, 238, 217, 100),
      ),
      body: Stack(
        children: [
          _buildBackground(),
          FutureBuilder<List<Prestatie>>(
            future: PrestatieService().getAll(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              return _prestatiesIndex(snapshot.data!, context);
            },
          ),
        ],
      ),
    );
  }

  Widget _prestatiesIndex(List<Prestatie> list, BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final prestatie = list[index];

        return FutureBuilder<Oefening>(
          future: OefeningService().getById(prestatie.oefeningId),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            final oefening = snapshot.data!;
            return ListTile(
              title: Text('Oefening: ${oefening.name}' , style: TextStyle(color: Colors.white)),
              subtitle: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ${prestatie.amount},' , style: TextStyle(color: Colors.grey[400]) ),
                  SizedBox(width: 5),
                  Text('Date: ${prestatie.date.toString()},' , style: TextStyle(color: Colors.grey[400])),
                  SizedBox(width: 5),
                  Text('Start: ${prestatie.time},' , style: TextStyle(color: Colors.grey[400])),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/oefeningen.jpg'), // Replace with your background image asset
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.85), BlendMode.dstATop), // Adjust opacity here
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'lib/assets/wallpaper.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(50),
              color: Colors.white70,
              child: Text(
                'prestaties',
                style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
