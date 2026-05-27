import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/meme_model.dart';
import 'memes_controller.dart';

class MemesView extends StatelessWidget {
  MemesView({super.key});

  // Lazily put controller — can also be done via binding
  final MemesController controller = Get.put(MemesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: _buildAppBar(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
        return _buildMemeList();
      }),
    );
  }

  // ─── AppBar ───────────────────────────────────────────────
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF0D0D0D),
      elevation: 0,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: controller.goBack,
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF1C1C1C),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
      title: const Text(
        'Memes',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.3,
        ),
      ),
    );
  }

  // ─── List ─────────────────────────────────────────────────
  Widget _buildMemeList() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: controller.memes.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final meme = controller.memes[index];
        return _MemeCard(
          meme: meme,
          onShare: () => controller.onShareTapped(meme),
        );
      },
    );
  }
}

// ─── Meme Card Widget ────────────────────────────────────────
class _MemeCard extends StatelessWidget {
  final MemeModel meme;
  final VoidCallback onShare;

  const _MemeCard({
    required this.meme,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meme.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  meme.description,
                  style: const TextStyle(
                    color: Color(0xFFBBBBBB),
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Share button
          GestureDetector(
            onTap: onShare,
            child: Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.share,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
