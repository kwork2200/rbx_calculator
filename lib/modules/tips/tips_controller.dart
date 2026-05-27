import 'package:get/get.dart';
import '../../models/tip_model.dart';

class TipsController extends GetxController {
  final RxList<TipModel> tips = <TipModel>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTips();
  }

  void loadTips() {
    isLoading.value = true;
    Future.delayed(const Duration(milliseconds: 400), () {
      tips.assignAll(_getTipsData());
      isLoading.value = false;
    });
  }

  void goBack() => Get.back();

  void openTipDetail(TipModel tip) {
    Get.toNamed('/tip-detail', arguments: tip);
  }

  List<TipModel> _getTipsData() {
    return [
      TipModel(
        id: 1,
        title: 'Staying Informed with App Updates',
        iconType: TipIconType.lightbulb,
        content:
            'Staying informed with app updates is key to unlocking the full potential of your Robx App experience. 🚀 Regular updates bring exciting new features, smoother performance, improved security, and fresh opportunities to earn even more Robx.\n\nBehind the scenes, the Robx team works tirelessly to fix bugs, optimize the interface, and roll out exclusive rewards and limited-time events available only in the latest versions.\n\nBy keeping your app up to date, you gain access to enhanced tools like upgraded spin wheels, smarter referral systems, improved redemption flows, and bonus activities designed to boost your balance. Many updates also introduce seasonal challenges, bonus reward systems, or new ways to earn points and diamonds — giving you more chances to win big.\n\nSecurity is just as important. Updates strengthen data protection, reduce risk of errors, and keep your account safe from threats. 🔐\n\nTo never miss an update, turn on auto-updates in your app store, follow official Robx social pages, and watch out for in-app alerts announcing what\'s new. Stay current, stay rewarded, and keep spinning your way to bigger and better prizes! 🎯✨',
      ),
      TipModel(
        id: 2,
        title: 'Play Game',
        iconType: TipIconType.gamepad,
        content:
            'Playing games in the Robx App is one of the most fun and rewarding ways to earn points! 🎮\n\nEach game you complete gives you bonus points and diamonds. The more you play, the more you unlock.\n\nTips to maximize your rewards:\n• Play daily to earn streak bonuses.\n• Complete challenges for extra diamonds.\n• Invite friends to unlock multiplayer rewards.\n• Watch for limited-time game events with big prizes.\n\nRemember: consistency is key. Players who game daily earn up to 3x more rewards than casual players. Start playing and watch your balance grow! 🏆',
      ),
      TipModel(
        id: 3,
        title: 'Engaging with the Community',
        iconType: TipIconType.lightbulb,
        content:
            'The Robx community is one of the most vibrant gaming communities out there! 🌟\n\nBy engaging with fellow players, you can:\n• Share tips and strategies\n• Join group challenges for bonus rewards\n• Participate in community events\n• Get early access to new features\n\nJoin our Discord, follow us on social media, and participate in weekly community challenges. Active community members earn exclusive badges and bonus Robx rewards!\n\nRemember: together we grow stronger. The more you engage, the more you earn! 🤝',
      ),
      TipModel(
        id: 4,
        title: 'Exploring the Robx Marketplace',
        iconType: TipIconType.lightbulb,
        content:
            'The Robx Marketplace is your one-stop destination for amazing deals and exclusive items! 🛒\n\nWhat you can find in the Marketplace:\n• Limited edition avatar items\n• Game passes and power-ups\n• Exclusive cosmetic bundles\n• Seasonal special offers\n\nPro tips for the Marketplace:\n✅ Check daily for flash sales\n✅ Save your Robx for limited-time items\n✅ Use promo codes for extra discounts\n✅ Follow marketplace announcements for restocks\n\nSmart shopping = more value for your Robx! 💎',
      ),
      TipModel(
        id: 5,
        title: 'Navigating the Robx App',
        iconType: TipIconType.lightbulb,
        content:
            'Mastering the Robx App navigation will save you time and help you discover hidden features! 🗺️\n\nKey sections to explore:\n• Dashboard — your earnings overview\n• Spin Wheel — daily free spins\n• Tasks — earn points through missions\n• Referrals — invite friends for bonuses\n• Marketplace — spend your rewards\n• Profile — manage your account\n\nHidden gems:\n🔍 Long-press items for more options\n🔍 Swipe left on notifications to dismiss\n🔍 Double-tap the spin wheel for quick access\n🔍 Pull down on any screen to refresh\n\nThe more you explore, the more rewards you\'ll discover! 🎁',
      ),
      TipModel(
        id: 6,
        title: 'Managing your Robx Balance',
        iconType: TipIconType.lightbulb,
        content:
            'Smart balance management is the secret to maximizing your Robx experience! 💰\n\nBest practices for managing your balance:\n• Track your daily earnings in the Dashboard\n• Set spending goals before visiting the Marketplace\n• Save up for high-value limited items\n• Never spend during bonus earning periods\n\nEarning strategies:\n✅ Complete all daily tasks first\n✅ Use the spin wheel every day\n✅ Refer friends for big bonus rewards\n✅ Participate in seasonal events\n\nBudgeting tip: Treat your Robx like real money — spend wisely, save strategically, and always look for the best value! 📊',
      ),
      TipModel(
        id: 7,
        title: 'Earning More with Referrals',
        iconType: TipIconType.lightbulb,
        content:
            'The referral program is the fastest way to multiply your Robx earnings! 👥\n\nHow referrals work:\n1. Share your unique referral code\n2. Friend signs up using your code\n3. Both of you get bonus Robx!\n4. You earn % of their activity rewards forever\n\nPro referral tips:\n• Share on WhatsApp, Instagram, and TikTok\n• Post in gaming groups and forums\n• Create content about the app\n• Host giveaways using your code\n\nTop referrers earn 10x more than regular users. Start sharing and watch your passive income grow! 🚀💸',
      ),
      TipModel(
        id: 8,
        title: 'Mastering the Spin Wheel',
        iconType: TipIconType.lightbulb,
        content:
            'The Spin Wheel is your daily ticket to big rewards — and there are tricks to maximize it! 🎡\n\nSpin Wheel basics:\n• You get free daily spins every 24 hours\n• Watch ads for bonus spins\n• Complete tasks for extra spin tokens\n• Special events give multiplied spins\n\nMaximizing your spins:\n✅ Spin at the same time every day to build streaks\n✅ Save bonus spins for double-reward events\n✅ Complete the daily task wheel first\n✅ Check for limited-time jackpot wheels\n\nConsistent spinning = consistent winning. Never skip your daily spin! 🏆✨',
      ),
    ];
  }
}
