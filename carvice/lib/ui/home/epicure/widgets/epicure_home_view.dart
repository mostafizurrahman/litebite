import 'package:cached_network_image/cached_network_image.dart';
import 'package:carvice/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:uisystem/uisystem.dart';

import '../../../widgets/image_widget.dart';

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
                  CachedNetworkImage(
                    imageUrl:"",// epicure.profileImage,
                    errorWidget: (_, __, ___) => ImageWidget .defaultCoverImage,
                  ),
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
