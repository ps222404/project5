import 'package:flutter/material.dart';
import 'package:project5mobile/service/Oefeningenservice.dart';
import 'package:project5mobile/models/Oefening.dart';
import '../Prestaties/PrestatieCreate.dart';
import 'package:intl/intl.dart';
import 'package:project5mobile/service/Inlogservice.dart';

class ShowOefening extends StatelessWidget {
  final int id;

  const ShowOefening({required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(15, 238, 217, 100),
        title: FutureBuilder<Oefening>(
          future: OefeningService().getById(id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.name, style: TextStyle(fontSize: 20, color: Colors.white));
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}', style: TextStyle(fontSize: 20, color: Colors.white));
            } else {
              return const Text('Loading...', style: TextStyle(fontSize: 20, color: Colors.white));
            }
          },
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          _buildBackground(),
          _buildOefeningWidget()
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
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.85),
            BlendMode.dstATop,
          ), // Adjust opacity here
        ),
      ),
    );
  }

  Widget _buildOefeningWidget() {
    return FutureBuilder<Oefening>(
      future: OefeningService().getById(id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final oefening = snapshot.data!;
          return ListView(
            children: [
              ListTile(
                title: Image.asset(
                  'lib/assets/${oefening.gif}',
                  width: MediaQuery.of(context).size.width,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${oefening.description} water', style: TextStyle(fontSize: 18, color: Colors.white)),
                    Text('${oefening.explanation} aarde', style: TextStyle(fontSize: 16, color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(height: 100),
              if (UserData.authToken != null)  Center(
                child: ElevatedButton(
                  onPressed: () {// Get the current time
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrestatiesCreate(id: oefening.id), // Pass the current time to the PrestatiesCreate page
                      ),
                    );
                  },
                  child: Text('Start Oefening', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(fontSize: 20, color: Colors.white)));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
