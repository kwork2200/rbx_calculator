import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ads/ad_on_back_wrapper.dart';
import '../../ads/bottom_native_ad_bar.dart';
import '../../models/tip_model.dart';

class TipDetailView extends StatelessWidget {
  const TipDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    // Receive tip via Get.arguments
    final TipModel tip = Get.arguments as TipModel;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      bottomNavigationBar: const BottomNativeAdBar(),
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              tip.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 20),
            // Content
            Text(
              tip.content,
              style: const TextStyle(
                color: Color(0xFFCCCCCC),
                fontSize: 15,
                height: 1.65,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF0D0D0D),
      elevation: 0,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: () => handleBackWithAd(context),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF1C1C1C),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
          ),
        ),
      ),
      title: const Text(
        'Tips & Tricks',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
