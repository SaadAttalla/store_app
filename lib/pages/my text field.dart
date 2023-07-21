import 'package:flutter/material.dart';


    class mytextfield extends StatelessWidget {
    final  TextInputType textInputTypeee;
    final  bool ispassword;
  final  String hintexttt;



    mytextfield({ Key? key,
  required this.textInputTypeee,
  required this.ispassword,
  required this.hintexttt, required controller,
    }) : super(key: key);

      @override
      Widget build(BuildContext context) {
        return  TextField(
          keyboardType: textInputTypeee,
          obscureText: ispassword,
          decoration: InputDecoration(
              hintText:  hintexttt,
              enabledBorder: OutlineInputBorder(
                  borderSide: Divider.createBorderSide(context)

              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,

                  )
              ),
              filled: true,
              contentPadding: const EdgeInsets.all(8)


          ),
        );
      }
    }
