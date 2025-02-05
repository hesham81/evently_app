import 'package:evently/core/utils/firestore_services.dart';

import '../../../models/event_model.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class EventCart extends StatefulWidget {
  final EventModel model;

  const EventCart({
    super.key,
    required this.model,
  });

  @override
  State<EventCart> createState() => _EventCartState();
}

class _EventCartState extends State<EventCart> {
  var isFav = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 0.3.height,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              widget.model.imagePath,
            ),
            fit: BoxFit.fitHeight,
          ),
          borderRadius: BorderRadius.circular(16)),
      child: Expanded(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              decoration: BoxDecoration(
                color: Color(0xffF2FEFF).withOpacity(0.8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "21\nNov",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.secondary,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 0.045.height,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Expanded(
                child: Row(
                  children: [
                    0.014.verSpace,
                    Expanded(
                      child: Text(
                        widget.model.event,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                    Expanded(child: Spacer()),
                    GestureDetector(
                      onTap: () {
                        widget.model.isLiked = !(widget.model.isLiked);
                        FireStoreServices.updateLiked(
                          id: widget.model.id,
                          isLiked: widget.model.isLiked,
                        );
                        setState(() {});
                      },
                      child: Icon(
                        (widget.model.isLiked)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: AppColors.secondary,
                      ),
                    ),
                    0.01.verSpace
                  ],
                ),
              ),
            ).centerBottomWidget()
          ],
        ),
      ),
    );
  }
}
