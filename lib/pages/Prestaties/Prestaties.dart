import 'package:flutter/material.dart';
import 'package:project5mobile/service/PrestatieService.dart';
import 'package:project5mobile/models/Prestatie.dart';

class Prestaties extends StatelessWidget {
  const Prestaties({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prestaties Index'),
      ),
      body: FutureBuilder<List<Prestatie>>(
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
    );
  }

  Widget _prestatiesIndex(List<Prestatie> list, BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final prestatie = list[index];

        return ListTile(
          title: Text('Oefening ID: ${prestatie.oefeningId}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Amount: ${prestatie.amount}'),
              Text('Date: ${prestatie.date.toString()}'),
              Text('Start: ${prestatie.start.format(context)}'),
              Text('End: ${prestatie.end.format(context)}'),
            ],
          ),
        );
      },
    );
  }
}
