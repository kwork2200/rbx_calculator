import 'package:flutter/material.dart';
import 'package:rbx_calculator/ads/hybrid_banner_ad_widget.dart';

import 'hybrid_native_ad_widget.dart';

/// Fixed native ad bar shown at the bottom of a screen.
///
/// It renders the hybrid native ad (Google -> Facebook -> third-party) and
/// collapses to zero height when no ad is available, so no empty space is
/// reserved. Use it as the `Scaffold.bottomNavigationBar`.
class BottomNativeAdBar extends StatelessWidget {
  const BottomNativeAdBar({super.key, this.height = 90});

  /// Height used for Facebook / third-party native ads.
  final double height;

  @override
  Widget build(BuildContext context) {
    return HybridBannerAdWidget();
  }
}
