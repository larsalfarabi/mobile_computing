import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';
import 'data/user_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProfile user = UserProfile(
      name: 'Hang Nadi',
      desc: 'Mobile Computing Lecturer',
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.account_circle,
            size: AppSizes.metric80,
            color: Colors.blueGrey,
          ),
          const SizedBox(height: AppSizes.metric16),
          Text(
            user.name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppSizes.metric8),
          Text(user.desc, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: AppSizes.metric24),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Lihat Portofolio'),
          ),
          const SizedBox(height: AppSizes.metric24),
        ],
      ),
    );
  }
}
