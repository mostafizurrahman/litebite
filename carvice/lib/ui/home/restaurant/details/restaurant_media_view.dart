import 'package:cached_network_image/cached_network_image.dart';
import 'package:carvice/domain/domain.dart';
import 'package:carvice/ui/utility/ui_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uisystem/theme/text_theme.dart';

class RestaurantMediaView extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantMediaView({required this.restaurant});

  @override
  State<StatefulWidget> createState() {
    return _RestaurantMediaState();
  }
}

class _RestaurantMediaState extends State<RestaurantMediaView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width * 0.5,
      child: Stack(
        children: [
          CachedNetworkImage(imageUrl: widget.restaurant.coverImage, fit: BoxFit.fitWidth, width: width, ),
          Positioned(
            left: 12,
            bottom: 12,
            child: Row(
              children: [
                CustomProfileImage(imageUrl: widget.restaurant.profileImage, size: 120,),
                const SizedBox(width: 12),
                Text(
                  widget.restaurant.name.txt,
                  style: TextStyle(
                    fontSize: 42, // Adjust font size
                    fontWeight: FontWeight.bold, // Make text bold
                    color: Colors.limeAccent, // Primary text color
                    shadows: [
                      Shadow(
                        color: Colors.white, // White shadow
                        blurRadius: 15,
                        // 4-radius shadow
                         offset: Offset(4, 4), // Slight offset for depth
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomProfileImage extends StatelessWidget {
  final String imageUrl;
  final double size;

  const CustomProfileImage({
    Key? key,
    required this.imageUrl,
    this.size = 80.0, // Default size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3), // 3-width white border
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5), // White shadow
            blurRadius: 4, // 4-radius shadow
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
