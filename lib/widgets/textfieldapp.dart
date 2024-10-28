import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TExtFieldApp extends StatelessWidget {
  TExtFieldApp(
      {super.key,
      required this.iconField,
      required this.lText,
      this.HText,
      this.control,
      this.Sicon,
      this.obsecure = false,
      this.valid,this.change});
  Icon iconField;
  String lText;
  String? HText;
  TextEditingController? control;
  final bool obsecure;
  Widget? Sicon;
  final String? Function(String?)? valid;
  final String? Function(String?)? change;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 60,
      child: TextFormField(
        onChanged: change,
        controller: control,
        obscureText: obsecure,
        decoration: InputDecoration(
            prefixIcon: iconField,
            iconColor: const Color(0xffF83758),
            prefixIconColor: const Color(0xffF83758),
            suffixIcon: Sicon,
            labelText: lText,
            hintText: HText,
            labelStyle: const TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500),
            hintStyle: const TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500),
            floatingLabelStyle: const TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xffF83758),
                fontSize: 20,
                fontWeight: FontWeight.w500),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xffF83758))),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10)),
            errorStyle: const TextStyle(height: 0.5)),
        validator: valid,
      ),
    );
  }
}
