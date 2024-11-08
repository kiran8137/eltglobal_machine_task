



import 'package:flutter/material.dart';

Padding textFormField({required String labelText , required String hintText ,required BoxConstraints constraints , required bool isObscureNeed ,required TextEditingController controller ,required String? Function(String?)? validator}) {
  ValueNotifier<bool> obscureValue = ValueNotifier<bool>(true); // to toggle the visibility icon
    return Padding(
      
            padding:  EdgeInsets.symmetric(horizontal:18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(labelText,style: TextStyle(fontSize: 12 , color: Color.fromARGB(255, 123, 123, 123)),),
                const SizedBox(height: 5),
                SizedBox(
                width: constraints.maxWidth < 600 ? 300 : constraints.maxHeight < 600 ? 300 : 500,
                
                child: ValueListenableBuilder(
                  valueListenable: obscureValue,
                  builder: (context, value, child) => 
                    TextFormField(
                     controller: controller,
                     validator: validator,
                     autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: isObscureNeed == true ? value : false,
                    decoration: InputDecoration(
                       errorBorder: OutlineInputBorder(
                         borderSide: const BorderSide(color: Color.fromARGB(255, 211, 37, 24), width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                       ),
                       focusedErrorBorder: OutlineInputBorder(
                         borderSide: const BorderSide(color:  Color.fromARGB(255, 211, 37, 24), width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                       ),
                       hintText: hintText,
                       hintStyle: const TextStyle(fontWeight: FontWeight.w400 , fontSize: 15 ,),
                       enabledBorder: OutlineInputBorder(
                         borderSide: const BorderSide(color: Color.fromARGB(102, 158, 158, 158), width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                       ),
                       focusedBorder:OutlineInputBorder(
                            borderSide:   BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        suffixIcon: IconButton(
                          onPressed: (){
                            obscureValue.value = !obscureValue.value;
                          }, 
                        
                           icon: isObscureNeed == false ? const SizedBox() :  value? const Icon( Icons.visibility_outlined,color: Colors.grey,size: 18,)
                          : const Icon(  Icons.visibility_off_outlined,color: Colors.grey,size: 18,)
                    )
                    )
                  ),
                ),
                                  ),
              ],
            ),
          );
  }
 