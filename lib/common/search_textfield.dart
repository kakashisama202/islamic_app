import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controllers/general_controller.dart';
import 'package:islamic_app/generated/l10n.dart';
import 'package:islamic_app/svg_pictures.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, this.isEnabled = false, this.onChanged});
  final bool isEnabled;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    final GeneralController generalController = Get.find();
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: TextField(
          enabled: isEnabled,
          onChanged: onChanged,
          controller: generalController.searchController,
          decoration: InputDecoration(
            hintText: S.of(context).searchHint,
            suffixIcon: IconButton(
              icon: generalController.searchText.value.isNotEmpty
                  ? const Icon(
                      Icons.clear,
                      color: Color(0xffDFB883),
                    )
                  : SvgPicturesMethods.searchIcon(),
              onPressed: generalController.searchText.value.isNotEmpty
                  ? () {
                      generalController.searchController.clear();
                    }
                  : null,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: Colors.blue),
            ),
          ),
        ),
      );
    });
  }
}
