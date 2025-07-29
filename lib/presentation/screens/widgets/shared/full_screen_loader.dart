import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      final messages = <String>[
        'Cargando películas',
        'Comprando palomitas de maiz',
        'Cargando populares',
        'Llamando a mi novia',
        'Ya casi...',
        '¿Sigues ahí?',
      ];
      return messages[step];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere por favor'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Text('Cargando...');
              } else {
                return Text(snapshot.data!);
              }
            },
          ),
        ],
      ),
    );
  }
}
