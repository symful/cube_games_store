import 'package:flutter/material.dart';

class HomeSearchField extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback submit;
  const HomeSearchField({
    super.key,
    required this.searchController,
    required this.submit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: TextField(
        controller: searchController,

        cursorColor: Color(0xffB7BED5),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
          fontSize: 12,
        ),
        decoration: InputDecoration(
          prefixIcon: InkWell(
            onTap: submit,
            child: Icon(Icons.search, color: Color(0xffB7BED5)),
          ),
          hintText: 'Search games...',
          hintStyle: TextStyle(
            color: Color(0xffB7BED5),
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            fontSize: 12,
            letterSpacing: 0.5,
          ),
          iconColor: Color(0xffB7BED5),
          filled: true,
          fillColor: Color(0xff13151a),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
        ),
      ),
    );
  }
}
