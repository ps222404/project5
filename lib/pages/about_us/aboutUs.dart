import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AboutDialog(
                applicationName: 'Summa move App',
                applicationVersion: '1.0.0+1',
                applicationIcon: CircleAvatar(
                  child: Image.asset(
                    'lib/assets/logo-1861420_1280.gif',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                applicationLegalese: '© 2023 Jasper Millar, Shuceyb Maalin and Daniel Tankink. All rights reserved.',
              ),
            );
          },
          child: const Text('Show About Dialog'),
        ),
      ),
    );
  }
}