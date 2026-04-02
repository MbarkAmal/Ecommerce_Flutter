import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Padding(
        padding: const EdgeInsets.all(16),
        
        child: Column(
          children: [
         // centred  part
         Center(
          child:Column(
            children: const [
              //image
             CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage("https://i.pinimg.com/736x/f7/53/f8/f753f8bd83f238f2972cb5942be4e771.jpg"),
            ),
             SizedBox(height: 12),
              //name
             Text(
              "AMAL mbark",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                
              ),
            ),
             SizedBox(height: 12),

            ],
          ),
         ) ,  
            const SizedBox(height: 30),
            // left part 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 ListTile(
          leading: Icon(Icons.favorite, color: Colors.red),
          title: Text("My Favorites"),
          onTap: () {},
        ),
         Divider(),

         ListTile(
          leading: Icon(Icons.logout, color: Colors.black),
          title: Text('Logout'),
          onTap: () {},
         )
              ],
            )
           
          ],
        ),
        ) ,
    );
  }

}