import 'package:deliveryapplication/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String searchText;
  final Function() onPressedNotifications;
  final Function() onPressedFavorite;
  final Function() onPressedSearch;
  final void Function(String)? onChangedSearch;

  final TextEditingController myController;

  const CustomAppBar({
    super.key,
    required this.searchText,
    required this.onPressedNotifications,
    required this.onPressedSearch,
    required this.onPressedFavorite,
    required this.onChangedSearch,
    required this.myController,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: onChangedSearch,
              controller: myController,
              decoration: InputDecoration(
                hintText: searchText,
                hintStyle: TextStyle(
                  color: ColorConstant.puplerLight,
                  fontSize: 16,
                ),

                prefixIcon: IconButton(
                  onPressed: onPressedSearch,
                  icon: Icon(
                    Icons.search_outlined,
                    color: ColorConstant.puplerLight,
                  ),
                ),

                filled: true,
                fillColor: Colors.grey[200],

                contentPadding: EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 10,
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorConstant.puplerDistinct),
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 9),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: onPressedNotifications,
              icon: Icon(
                Icons.notifications_active_outlined,
                size: 32,
                color: ColorConstant.puplerDistinct,
              ),
            ),
          ),
          SizedBox(width: 8),

          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: onPressedFavorite,
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 32,
                color: ColorConstant.puplerDistinct,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
