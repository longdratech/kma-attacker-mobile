import 'package:attacker_kma_app/common_widgets/google_map.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: GoogleMapWidget()),
        // Expanded(child: LocationStreamWidget())
      ],
    );
  }
}