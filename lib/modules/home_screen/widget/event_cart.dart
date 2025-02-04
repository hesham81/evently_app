import 'package:evently/core/extensions/dimensions.dart';
import 'package:evently/core/extensions/extensions.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class EventCart extends StatefulWidget {
  const EventCart({super.key});

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
                "assets/images/book.png",
              ),
              fit: BoxFit.fitHeight),
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
                    Text(
                      "This is a Birthday Party ",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackColor,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (){
                        (isFav) ? isFav = false : isFav = true;
                        setState(() {

                        });
                      },
                      child: Icon(
                        (isFav) ? Icons.favorite:Icons.favorite_border,
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
