import 'package:flutter/material.dart';
import 'package:project5mobile/service/Oefeningenservice.dart';
import 'package:project5mobile/models/Oefening.dart';

class Oefeningen extends StatelessWidget {
  const Oefeningen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Oefeningen Index'),
      ),
      body: FutureBuilder<List<Oefening>>(
        future: OefeningService().getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          return _oefeningenIndex(snapshot.data!, context);
        },
      ),
    );
  }

  Widget _oefeningenIndex(List<Oefening> list, BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final oefening = list[index];

        return ListTile(
          title: Center(
            child: Text(oefening.name),
          ),
          // subtitle: Text(oefening.description),
        );
      },
    );

  }
}
