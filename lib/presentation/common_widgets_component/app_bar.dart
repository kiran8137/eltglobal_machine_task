
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar commonAppBar(BuildContext context , [String? title]) {
    return AppBar(
      actions: [
         IconButton(
          onPressed: (){
    
            showDialog(
              context: context, 
              builder: (context){
                return AlertDialog(
                  title: Text("Are you sure want to logour"),
                  actions: [
                   TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                     child: Text('cancel')
                     ),
                     TextButton(
                    onPressed: (){
                      context.go('/loginscreen');
                      
                    },
                     child: Text('cancel')
                     )
                  ],
                );
              }
              );
            context.go('/loginscreen');
          }, 
          icon: Icon(Icons.logout)
          )
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Text( title ?? '',
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: MediaQuery.of(context).size.width < 600 ? 20 : 24
      ),
      ),
      
    );
  }