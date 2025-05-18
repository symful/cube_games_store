import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final bool obscure;
  final TextInputType? keyboardType;
  final FormFieldValidator<String> validator;

  const AuthField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.obscure = false,
    this.keyboardType,
    required this.validator,
    super.key,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          TextFormField(
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            obscureText: widget.obscure,
            validator: widget.validator,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(widget.icon, color: Color(0xff969696)),
              hintText: widget.hint,
              hintStyle: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12,
                color: Color(0xff969696),
                fontWeight: FontWeight.w500,
              ),
              errorText:
                  widget.controller.text.isEmpty
                      ? null
                      : widget.validator(widget.controller.text),
              errorStyle: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12,
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
