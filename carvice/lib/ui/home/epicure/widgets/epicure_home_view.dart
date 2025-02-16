import 'package:carvice/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:uisystem/uisystem.dart';

class EpicureHomeView extends StatelessWidget {
  final Epicure   epicure;

  EpicureHomeView({required this.epicure});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      child: Material(
        child: Container(
          width: double.maxFinite,
          decoration: ContainerTheme.shadowDec,
          height: 230,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Text(epicure.name)),
                  Image.network(epicure.profileImage),
                ],
              ),
              Expanded(child: Text(epicure.email)),
            ],
          ),
        ),
      ),
    );
  }
}
