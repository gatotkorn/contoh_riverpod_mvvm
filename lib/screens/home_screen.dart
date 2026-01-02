import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_model.dart';
import '../view_models/user_vm.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: _SliverAppBarDelegate(
              expandedHeight: 200.0,
              user: user,
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildLeaveCard('Cuti Pokok', user.annualLeave),
                      _buildLeaveCard('Cuti Terpakai', user.usedLeave),
                      _buildLeaveCard('Stok Cuti', user.remainingLeave),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Aksi tombol ESS
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(16),
                    ),
                    child: const Column(
                      children: [
                        Icon(Icons.person, size: 40),
                        SizedBox(height: 8),
                        Text('ESS'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Tambahkan konten lain di bawah jika diperlukan (misal list)
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(title: Text('Item $index')),
              childCount: 20, // Contoh konten scrollable
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaveCard(String title, int value) {
    return Card(
      color: Colors.blue[100],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Text(title),
            Text(value.toString(), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final UserModel user;

  _SliverAppBarDelegate({required this.expandedHeight, required this.user});

  @override
  double get minExtent => kToolbarHeight + 14; // Sedikit lebih tinggi agar teks muat

  @override
  double get maxExtent => expandedHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double shrinkRatio = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

    // Ukuran avatar: besar saat expanded, kecil saat collapsed
    final double avatarSize = lerpDouble(100, 40, shrinkRatio)!;

    // Opacity untuk bagian expanded (hilang saat collapse)
    final double expandedOpacity = (1 - shrinkRatio).clamp(0.0, 1.0);

    // Opacity untuk bagian collapsed (muncul saat collapse)
    final double collapsedOpacity = shrinkRatio;

    return Container(
      color: Colors.blue[100],
      child: Stack(
        children: [
          Opacity(
            opacity: expandedOpacity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: avatarSize / 2,
                    backgroundImage: const AssetImage('assets/images/profile.png'),
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    user.name,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${user.nik} • ${user.joinDate}',
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),

          // === Bagian COLLAPSED (kiri, seperti AppBar biasa) ===
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: collapsedOpacity,
              child: Container(
                height: kToolbarHeight + 8,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20, // Tetap 40px diameter saat collapsed
                      backgroundImage: const AssetImage('assets/images/profile.png'),
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            user.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${user.nik} • ${user.joinDate}',
                            style: const TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Tombol menu di kanan (selalu terlihat)
          Positioned(
            top: 0,
            right: 0,
            child: Opacity(
              opacity: 1 - expandedOpacity, // Muncul hanya saat mulai collapse
              child: IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.black87),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

  double? lerpDouble(double a, double b, double t) {
    return a + (b - a) * t.clamp(0.0, 1.0);
  }
}