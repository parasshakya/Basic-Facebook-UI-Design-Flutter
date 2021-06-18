import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/models/models.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_facebook_clone/Custom Widgets/widgets.dart';

class ContactsList extends StatelessWidget {
  final List<User> users;

  const ContactsList({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(children: [
              Expanded(
                child: Text(
                  'Contacts',style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
                ),
              ),
              Icon(
                Icons.search,
                color: Colors.grey[600],
              ),
              SizedBox(width: 8.0,),
              Icon(
                Icons.more_horiz,
                color: Colors.grey[600],
              )
            ],),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 5.0),
              itemBuilder: (context,index){
                final User _user = users[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: UserCard(user: _user),
                );
              },
              itemCount: users.length,
            ),
          )
        ],
      ),
    );
  }
}
