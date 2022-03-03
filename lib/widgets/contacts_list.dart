import 'package:facebook_clone_responsive_ui/widgets/user_card.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key, required this.users}) : super(key: key);
  final List<User> users;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Contacts',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                Icons.search,
                color: Colors.grey.shade600,
              ),
              const SizedBox(width: 8.0),
              Icon(
                Icons.more_horiz,
                color: Colors.grey.shade600,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: UserCard(
                    currentUser: users[index],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
