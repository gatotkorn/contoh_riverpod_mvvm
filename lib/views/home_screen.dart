// import 'dart:ui';
//
// import 'package:contoh_riverpod/utils/page_transitions.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../models/user_model.dart';
// import '../view_models/user_vm.dart';
//
// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});
//
//   // @override
//   // Widget build(BuildContext context, WidgetRef ref) {
//   //   final user = ref.watch(userProvider);
//   //
//   //   return Scaffold(
//   //     body: CustomScrollView(
//   //       slivers: [
//   //         SliverPersistentHeader(
//   //           delegate: _SliverAppBarDelegate(
//   //             expandedHeight: 200.0,
//   //             user: user,
//   //           ),
//   //           pinned: true,
//   //         ),
//   //         SliverToBoxAdapter(
//   //           child: Padding(
//   //             padding: const EdgeInsets.all(16.0),
//   //             child: Column(
//   //               children: [
//   //                 Row(
//   //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //                   children: [
//   //                     _buildLeaveCard('Cuti Pokok', user.annualLeave),
//   //                     _buildLeaveCard('Cuti Terpakai', user.usedLeave),
//   //                     _buildLeaveCard('Stok Cuti', user.remainingLeave),
//   //                   ],
//   //                 ),
//   //                 const SizedBox(height: 16),
//   //                 ElevatedButton(
//   //                   onPressed: () {
//   //                     // Navigator.push(context, slideTransitionPageRoute(page: page))
//   //                   },
//   //                   style: ElevatedButton.styleFrom(
//   //                     shape: RoundedRectangleBorder(
//   //                       borderRadius: BorderRadius.circular(8),
//   //                     ),
//   //                     padding: const EdgeInsets.all(16),
//   //                   ),
//   //                   child: const Column(
//   //                     children: [
//   //                       Icon(Icons.person, size: 40),
//   //                       SizedBox(height: 8),
//   //                       Text('ESS'),
//   //                     ],
//   //                   ),
//   //                 ),
//   //               ],
//   //             ),
//   //           ),
//   //         ),
//   //         // Tambahkan konten lain di bawah jika diperlukan (misal list)
//   //         SliverList(
//   //           delegate: SliverChildBuilderDelegate(
//   //                 (context, index) => ListTile(title: Text('Item $index')),
//   //             childCount: 20, // Contoh konten scrollable
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
//
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final user = ref.watch(userProvider);
//     return Scaffold(
//       body: CustomScrollView(
//         physics: const AlwaysScrollableScrollPhysics(),
//         slivers: [
//
//           // SliverAppBar(
//           //   expandedHeight: 200.0,
//           //   pinned: true,
//           //   backgroundColor: Colors.blue[100],
//           //   elevation: 0,
//           //   flexibleSpace: LayoutBuilder(
//           //     builder: (context, constraints) {
//           //       final double currentHeight = constraints.biggest.height;
//           //       final double maxHeight = 200.0;
//           //       final double minHeight = kToolbarHeight;
//           //
//           //       // 0 = fully expanded, 1 = fully collapsed
//           //       final double shrinkRatio = ((maxHeight - currentHeight) / (maxHeight - minHeight)).clamp(0.0, 1.0);
//           //
//           //       // Ukuran avatar: 80px → 40px (diameter)
//           //       final double avatarRadius = lerpDouble(40, 20, shrinkRatio)!;
//           //
//           //       // Padding atas untuk seluruh konten
//           //       final double topPadding = lerpDouble(60, 0, shrinkRatio)!;
//           //
//           //       return Padding(
//           //         padding: EdgeInsets.only(top: topPadding + MediaQuery.of(context).padding.top),
//           //         child: Stack(
//           //           children: [
//           //             // Background
//           //             Positioned.fill(
//           //               child: Container(color: Colors.blue[100]),
//           //             ),
//           //
//           //             // Konten utama: Row dengan Avatar di kiri + Teks di kanan
//           //             Positioned(
//           //               left: 16,
//           //               right: 56, // Biar ada ruang untuk tombol menu
//           //               top: 0,
//           //               bottom: 0,
//           //               child: Row(
//           //                 crossAxisAlignment: CrossAxisAlignment.center,
//           //                 children: [
//           //                   // Circle Avatar
//           //                   CircleAvatar(
//           //                     radius: avatarRadius,
//           //                     backgroundColor: Colors.white,
//           //                     backgroundImage: const AssetImage('assets/images/profile.png'),
//           //                   ),
//           //
//           //                   const SizedBox(width: 16),
//           //
//           //                   // Nama + NIK + Tanggal Masuk
//           //                   Expanded(
//           //                     child: Column(
//           //                       mainAxisAlignment: MainAxisAlignment.center,
//           //                       crossAxisAlignment: CrossAxisAlignment.start,
//           //                       children: [
//           //                         Text(
//           //                           user.name,
//           //                           style: TextStyle(
//           //                             fontSize: lerpDouble(22, 16, shrinkRatio),
//           //                             fontWeight: FontWeight.bold,
//           //                             color: Colors.black87,
//           //                           ),
//           //                         ),
//           //                         const SizedBox(height: 4),
//           //                         Text(
//           //                           '${user.nik} • ${user.joinDate}',
//           //                           style: TextStyle(
//           //                             fontSize: lerpDouble(16, 12, shrinkRatio),
//           //                             color: Colors.black54,
//           //                           ),
//           //                         ),
//           //                       ],
//           //                     ),
//           //                   ),
//           //                 ],
//           //               ),
//           //             ),
//           //
//           //             // Tombol menu di kanan (selalu terlihat)
//           //             Positioned(
//           //               top: 0,
//           //               right: 0,
//           //               bottom: 0,
//           //               child: Align(
//           //                 alignment: Alignment.centerRight,
//           //                 child: IconButton(
//           //                   icon: const Icon(Icons.more_vert, color: Colors.black87),
//           //                   onPressed: () {},
//           //                 ),
//           //               ),
//           //             ),
//           //           ],
//           //         ),
//           //       );
//           //     },
//           //   ),
//           // ),
//
//           // Konten di bawah header
//
//           SliverAppBar(
//             expandedHeight: 220.0,
//             pinned: true,
//             backgroundColor: Colors.blue[100],
//             elevation: 0,
//             flexibleSpace: LayoutBuilder(
//               builder: (context, constraints) {
//                 final double currentHeight = constraints.biggest.height;
//                 final double maxHeight = 220.0;
//                 final double minHeight = kToolbarHeight + MediaQuery.of(context).padding.top;
//
//                 // 0 = fully expanded, 1 = fully collapsed
//                 final double shrinkRatio = ((maxHeight - currentHeight) / (maxHeight - minHeight)).clamp(0.0, 1.0);
//
//                 // Ukuran radius avatar: 50 → 20 (diameter 100 → 40)
//                 final double avatarRadius = lerpDouble(50, 20, shrinkRatio)!;
//
//                 // Opacity untuk mode expanded (vertikal)
//                 final double expandedOpacity = (1 - shrinkRatio).clamp(0.0, 1.0);
//
//                 // Opacity untuk mode collapsed (horizontal)
//                 final double collapsedOpacity = shrinkRatio.clamp(0.0, 1.0);
//
//                 return Stack(
//                   children: [
//                     // Background
//                     Positioned.fill(
//                       child: Container(color: Colors.blue[100]),
//                     ),
//
//                     // === MODE EXPANDED: Avatar di atas, teks di bawah (centered) ===
//                     Padding(
//
//                       padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top+10),
//                       child: Center(
//                         child: Opacity(
//                           opacity: expandedOpacity,
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               CircleAvatar(
//                                 radius: avatarRadius,
//                                 backgroundColor: Colors.white,
//                                 backgroundImage: AssetImage('assets/images/jackie.jpg'),
//                                 // child: Image.asset('assets/images/jackie.jpg', fit: BoxFit.fill,),
//                               ),
//                               const SizedBox(height: 16),
//                               Text(
//                                 user.name,
//                                 style: TextStyle(
//                                   fontSize: lerpDouble(22, 16, shrinkRatio),
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black87,
//                                 ),
//                               ),
//                               const SizedBox(height: 4),
//                               Text(
//                                 '${user.nik} • ${user.joinDate}',
//                                 style: TextStyle(
//                                   fontSize: lerpDouble(16, 12, shrinkRatio),
//                                   color: Colors.black54,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     // === MODE COLLAPSED: Avatar di kiri, teks di kanan ===
//                     Positioned(
//                       left: 16,
//                       right: 56,
//                       top: MediaQuery.of(context).padding.top,
//                       bottom: 0,
//                       child: Opacity(
//                         opacity: collapsedOpacity,
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             CircleAvatar(
//                               radius: 20, // Fixed kecil saat collapsed
//                               backgroundColor: Colors.white,
//                               backgroundImage: AssetImage('assets/images/jackie.jpg', ),
//                               // child: Image.asset('assets/images/jackie.jpg', fit: BoxFit.fill,),
//                             ),
//                             const SizedBox(width: 12),
//                             Flexible(
//                               fit: FlexFit.loose,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     user.name,
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black87,
//                                     ),
//                                   ),
//                                   Text(
//                                     '${user.nik} • ${user.joinDate}',
//                                     style: const TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.black54,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                     // Tombol menu di kanan (hanya muncul saat collapsed atau semi-collapsed)
//                     Positioned(
//                       top: 0,
//                       right: 0,
//                       bottom: 0,
//                       child: Opacity(
//                         opacity: collapsedOpacity,
//                         child: Align(
//                           alignment: Alignment.centerRight,
//                           child: IconButton(
//                             icon: const Icon(Icons.more_vert, color: Colors.black87),
//                             onPressed: () {},
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//
//           SliverToBoxAdapter(
//             child: Container(
//               height: 800,
//               // color: Colors.green,
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       _buildLeaveCard('Cuti Pokok', user.annualLeave),
//                       _buildLeaveCard('Cuti Terpakai', user.usedLeave),
//                       _buildLeaveCard('Stok Cuti', user.remainingLeave),
//                     ],
//                   ),
//                   const SizedBox(height: 24),
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.all(20),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                     ),
//                     child: const Column(
//                       children: [
//                         Icon(Icons.person_outline, size: 48),
//                         SizedBox(height: 8),
//                         Text('ESS', style: TextStyle(fontSize: 16)),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 32),
//
//                   // Contoh konten panjang untuk test scroll
//                   // ListView.builder(
//                   //   shrinkWrap: true,
//                   //   physics: const NeverScrollableScrollPhysics(),
//                   //   itemCount: 30,
//                   //   itemBuilder: (context, index) {
//                   //     return ListTile(title: Text('Item ke-${index + 1}'));
//                   //   },
//                   // ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildLeaveCard(String title, int value) {
//     return Card(
//       color: Colors.blue[100],
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         child: Column(
//           children: [
//             Text(title),
//             Text(value.toString(), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//           ],
//         ),
//       ),
//     );
//   }
// }
// //
// // class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
// //   final double expandedHeight;
// //   final UserModel user;
// //
// //   _SliverAppBarDelegate({required this.expandedHeight, required this.user});
// //
// //   @override
// //   double get minExtent => kToolbarHeight + 8; // Sedikit lebih tinggi agar teks muat
// //
// //   @override
// //   double get maxExtent => expandedHeight;
// //
// //   @override
// //   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
// //     final double shrinkRatio = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);
// //
// //     // Ukuran avatar: besar saat expanded, kecil saat collapsed
// //     final double avatarSize = lerpDouble(100, 40, shrinkRatio)!;
// //
// //     // Opacity untuk bagian expanded (hilang saat collapse)
// //     final double expandedOpacity = (1 - shrinkRatio).clamp(0.0, 1.0);
// //
// //     // Opacity untuk bagian collapsed (muncul saat collapse)
// //     final double collapsedOpacity = shrinkRatio;
// //
// //     return Container(
// //       color: Colors.blue[100],
// //       child: Stack(
// //         children: [
// //           Opacity(
// //             opacity: expandedOpacity,
// //             child: Center(
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   CircleAvatar(
// //                     radius: avatarSize / 2,
// //                     backgroundImage: const AssetImage('assets/images/profile.png'),
// //                     backgroundColor: Colors.white,
// //                   ),
// //                   const SizedBox(height: 12),
// //                   Text(
// //                     user.name,
// //                     style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //                   ),
// //                   Text(
// //                     '${user.nik} • ${user.joinDate}',
// //                     style: const TextStyle(fontSize: 14, color: Colors.black54),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //
// //           // === Bagian COLLAPSED (kiri, seperti AppBar biasa) ===
// //           Positioned(
// //             top: 0,
// //             left: 0,
// //             right: 0,
// //             child: Opacity(
// //               opacity: collapsedOpacity,
// //               child: Container(
// //                 height: kToolbarHeight + 8,
// //                 padding: const EdgeInsets.symmetric(horizontal: 16),
// //                 child: Row(
// //                   children: [
// //                     CircleAvatar(
// //                       radius: 20, // Tetap 40px diameter saat collapsed
// //                       backgroundImage: const AssetImage('assets/images/profile.png'),
// //                       backgroundColor: Colors.white,
// //                     ),
// //                     const SizedBox(width: 12),
// //                     Expanded(
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           Text(
// //                             user.name,
// //                             style: const TextStyle(
// //                               fontSize: 16,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                           ),
// //                           Text(
// //                             '${user.nik} • ${user.joinDate}',
// //                             style: const TextStyle(fontSize: 12, color: Colors.black54),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     IconButton(
// //                       icon: const Icon(Icons.more_vert),
// //                       onPressed: () {},
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //
// //           // Tombol menu di kanan (selalu terlihat)
// //           Positioned(
// //             top: 0,
// //             right: 0,
// //             child: Opacity(
// //               opacity: 1 - expandedOpacity, // Muncul hanya saat mulai collapse
// //               child: IconButton(
// //                 icon: const Icon(Icons.more_vert, color: Colors.black87),
// //                 onPressed: () {},
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   @override
// //   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
// //
// //   double? lerpDouble(double a, double b, double t) {
// //     return a + (b - a) * t.clamp(0.0, 1.0);
// //   }
// // }

import 'dart:ui';

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
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 240.0,
            pinned: true,
            floating: true, // Agar bisa expand lagi saat tarik sedikit ke bawah
            snap: false,
            backgroundColor: Colors.blue[100],
            elevation: 0,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                // Tinggi saat ini dari flexibleSpace
                final double currentHeight = constraints.biggest.height;
                final double maxHeight = 240.0;
                final double minHeight = kToolbarHeight + MediaQuery.of(context).padding.top;

                // 0 = fully expanded, 1 = fully collapsed
                final double shrinkRatio =
                ((maxHeight - currentHeight) / (maxHeight - minHeight)).clamp(0.0, 1.0);

                // Ukuran avatar: radius 55 → 20 (diameter 110 → 40)
                final double avatarRadius = lerpDouble(55, 20, shrinkRatio)!;

                // Threshold: matikan expanded layout saat shrinkRatio > 0.6 (sebelum overflow)
                final bool showExpanded = shrinkRatio < 0.55;
                final double expandedOpacity = showExpanded ? (1 - shrinkRatio * 1.8).clamp(0.0, 1.0) : 0.0;
                final double collapsedOpacity = (shrinkRatio - 0.3).clamp(0.0, 1.0);

                return Stack(
                  children: [
                    // Background
                    Positioned.fill(
                      child: Container(color: Colors.blue[100]),
                    ),

                    // === MODE EXPANDED: Avatar besar di atas + teks di bawah (centered) ===
                    if (showExpanded)
                      Offstage(
                        offstage: !showExpanded,
                        child: Opacity(
                          opacity: expandedOpacity,
                          child: Padding(
                            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: avatarRadius,
                                  backgroundColor: Colors.white,
                                  backgroundImage: const AssetImage('assets/images/jackie.jpg'),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  user.name,
                                  style: TextStyle(
                                    fontSize: lerpDouble(24, 16, shrinkRatio),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  '${user.nik} • ${user.joinDate}',
                                  style: TextStyle(
                                    fontSize: lerpDouble(16, 12, shrinkRatio),
                                    color: Colors.black54,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    // === MODE COLLAPSED: Avatar kecil di kiri + teks di kanan ===
                    Positioned(
                      left: 16,
                      right: 56,
                      top: MediaQuery.of(context).padding.top,
                      bottom: 0,
                      child: Opacity(
                        opacity: collapsedOpacity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              backgroundImage: const AssetImage('assets/images/jackie.jpg'),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    '${user.nik} • ${user.joinDate}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Tombol menu di kanan (muncul saat semi/fully collapsed)
                    Positioned(
                      top: MediaQuery.of(context).padding.top,
                      right: 0,
                      bottom: 0,
                      child: Opacity(
                        opacity: collapsedOpacity,
                        child: IconButton(
                          icon: const Icon(Icons.more_vert, color: Colors.black87),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // Konten utama di bawah header
          SliverToBoxAdapter(
            child: Container(
              height: 800,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Card Cuti
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildLeaveCard('Cuti Pokok', user.annualLeave),
                        _buildLeaveCard('Cuti Terpakai', user.usedLeave),
                        _buildLeaveCard('Stok Cuti', user.remainingLeave),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Tombol ESS
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Navigate to ESS page
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                        ),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.person_outline, size: 48),
                            SizedBox(height: 12),
                            Text('ESS', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Placeholder konten panjang (untuk test scroll)
                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   itemCount: 30,
                    //   itemBuilder: (context, index) => ListTile(title: Text('Menu Item ${index + 1}')),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaveCard(String title, int value) {
    return Expanded(
      child: Card(
        elevation: 2,
        color: Colors.blue[50],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                value.toString(),
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

