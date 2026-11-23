import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    Future<void> logout() async {
      await FirebaseAuth.instance.signOut();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            tooltip: 'Logout',
            onPressed: logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 68,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            const SizedBox(height: 18),
            const Text(
              'Aditiya Surya Putra',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Mahasiswa Teknik Informatika',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 28),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Informasi Profil',
                      style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    const Divider(height: 28),
                    _info(Icons.person, 'Nama Lengkap', 'Aditiya Surya Putra'),
                    _info(Icons.phone, 'Nomor Telepon', '081313619268'),
                    _info(Icons.email, 'Email', user.email ?? '-'),
                    _info(Icons.verified_user, 'Email Terverifikasi',
                        user.emailVerified ? 'Ya' : 'Tidak'),
                    _info(Icons.fingerprint, 'UID Firebase', user.uid),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: logout,
                icon: const Icon(Icons.logout),
                label: const Text('LOGOUT'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _info(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                SelectableText(value),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
