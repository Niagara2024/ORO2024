import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../state_management/create_account_provide.dart';
import '../my_theme.dart';

class CustomeTextField extends StatefulWidget {
  FocusNode? needTofocus;
  String? errorMessage;
  String? hintText;
  TextInputType? Type;
  FocusNode? myFocus;
  Icon? icon;
  String? listeningHeading;
  CustomeTextField({super.key,
    required this.myFocus,
    required this.needTofocus,
    required this.listeningHeading,
    required this.errorMessage,
    required this.Type,
    required this.hintText,
    required this.icon,

  });

  @override
  State<CustomeTextField> createState() => _CustomeTextFieldState();
}

class _CustomeTextFieldState extends State<CustomeTextField> {
  TextEditingController formTextController = TextEditingController();
  String _value = '';
  @override
  Widget build(BuildContext context) {
    var createAccPvd = Provider.of<CreateActProvider>(context,listen : true);
    return TextFormField(
      controller: formTextController,
      focusNode: widget.myFocus,
      textInputAction: TextInputAction.next,
      onEditingComplete: ()=> FocusScope.of(context).requestFocus(widget.needTofocus),
      onChanged: (value){
        setState(() {
          _value = value;
        });
      },
      validator: (value){
        if(_value == ''){
          return '${widget.errorMessage}';
        }
        return null;
      },
      keyboardType: widget.Type,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: 16),
        filled: true,
        fillColor: liteBlue,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none
        ),
        prefixIcon: widget.icon,
        counterText: '',
        contentPadding: EdgeInsets.all(10),
      ),
    );
  }
}
