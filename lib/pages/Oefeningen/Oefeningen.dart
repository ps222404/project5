import 'package:flutter/material.dart';
import 'package:project5mobile/service/Oefeningenservice.dart';
import 'package:project5mobile/models/Oefening.dart';
import 'package:project5mobile/pages/about_us/aboutUs.dart';

class Oefeningen extends StatelessWidget {
  const Oefeningen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 100.0), // Pas de waarde hier aan
              child: Text('Oefeningen'),
            ),
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUsPage()),
                  );
                }
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          _buildBackground(), // Added background image
          Padding(
            padding: const EdgeInsets.only(top: 50.0), // Add margin to the top
            child: FutureBuilder<List<Oefening>>(
              future: OefeningService().getAll(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final oefening = snapshot.data![index];

                    return ListTile(
                      title: Center(
                        child: Text(oefening.name, style: TextStyle(fontSize: 25, color: Colors.white)), // Increased font size and changed color to white
                      ),
                      // subtitle: Text(oefening.description),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
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
    );
  }
}
