import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oro_2024/state_management/create_account_provide.dart';
import 'package:provider/provider.dart';
import '../theme.dart';
import 'inputHeading.dart';


class TexInputWithHeading extends StatefulWidget {
  FocusNode? needTofocus;
  FilteringTextInputFormatter conditionForData;
  FocusNode? myFocus;
  String Heading;
  String hintText;
  TextInputType Type;
  Icon icon;
  String errorMessage;
  String listeningHeading;
  TexInputWithHeading({super.key
    ,required this.Heading,
    required this.Type,
    required this.icon,
    required this.errorMessage,
    required this.needTofocus,
    required this.myFocus,
    required this.listeningHeading,
    required this.hintText,
    required this.conditionForData});

  @override
  State<TexInputWithHeading> createState() => _TexInputWithHeadingState();
}

class _TexInputWithHeadingState extends State<TexInputWithHeading> {
  TextEditingController formTextController = TextEditingController();
  String _value = '';
  @override
  void initState() {
    formTextController.addListener(() {
      print('Text changed: ${formTextController.text}');
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var createAccPvd = Provider.of<CreateActProvider>(context,listen : true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputHeading(heading: '${widget.Heading}',),
        TextFormField(
          controller: formTextController,
          inputFormatters: [
            widget.conditionForData,
          ],
          focusNode: widget.myFocus,
          textInputAction: TextInputAction.next,
          onEditingComplete: ()=> FocusScope.of(context).requestFocus(widget.needTofocus),
          onChanged: (value){
            setState(() {
              _value = value;
              createAccPvd.listenValueLength(widget.listeningHeading, value);
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
            hintStyle: TextStyle(fontSize: 12),
            filled: true,
            fillColor: liteBlue,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none
            ),
            prefixIcon: widget.icon,
            suffixIcon: createAccPvd.getValue(widget.listeningHeading).length > 1 ? GestureDetector(
                onTap: (){
                  setState(() {
                    formTextController.clear();
                    createAccPvd.listenValueLength(widget.listeningHeading, '');
                  });
                },
                child: Icon(Icons.clear_rounded)) : null,
            counterText: '',
            contentPadding: EdgeInsets.all(10),
          ),
        ),
      ],
    );
  }
}