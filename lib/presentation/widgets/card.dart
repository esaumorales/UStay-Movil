import 'package:flutter/material.dart';
import 'package:myapp/domain/entities/partner.dart';

class PartnerCard extends StatelessWidget {
  final Partner partner;

  const PartnerCard({Key? key, required this.partner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen de ejemplo
          Image.asset('assets/images/common/room_placeholder.png',
              height: 120, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              partner.nombreEmpresa,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('RUC: ${partner.ruc}'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('Teléfono: ${partner.telefono}'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('Email: ${partner.email}'),
          ),
        ],
      ),
    );
  }
}
