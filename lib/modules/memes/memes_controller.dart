import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/meme_model.dart';

class MemesController extends GetxController {
  // Observable list of memes
  final RxList<MemeModel> memes = <MemeModel>[].obs;

  // Loading state
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadMemes();
  }

  void loadMemes() {
    isLoading.value = true;

    // Simulate loading delay (replace with actual API call)
    Future.delayed(const Duration(milliseconds: 500), () {
      memes.assignAll(_getMemeData());
      isLoading.value = false;
    });
  }

  Future<void> onShareTapped(MemeModel meme) async {
    Share.share(
      meme.title,
      subject: 'RBX Calculator',
    );
  }

  void goBack() {
    Get.back();
  }

  List<MemeModel> _getMemeData() {
    return [
      MemeModel(
        id: 1,
        title: 'Spawn Trapping',
        description: "Spawning in the middle of chaos like: 'Guess I'll die.' 🤦😭",
      ),
      MemeModel(
        id: 2,
        title: 'Relatable Gamer Meme',
        description: 'When your WiFi disconnects mid-game. 📶😢😈',
      ),
      MemeModel(
        id: 3,
        title: 'Robx Trade Offers',
        description: "When someone offers you a trade that's clearly not fair: Nice try, buddy. 👀🙄😂",
      ),
      MemeModel(
        id: 4,
        title: 'Friend Joins After Game Ends',
        description: 'When your friend joins the server right after you rage-quit. 😡💀🤷',
      ),
      MemeModel(
        id: 5,
        title: 'Robx Budgeting',
        description: "Me: I'll save my Robx for something special. Also me: buys a hat for 5 Robx 🎩😂",
      ),
      MemeModel(
        id: 6,
        title: 'Roblox Fashion',
        description: 'When you see someone with a cool outfit: I need that in my life! 🤩🔥',
      ),
      MemeModel(
        id: 7,
        title: 'Roblox Pets',
        description: "When you finally get that rare pet: I'm never letting you go! 🐾😍",
      ),
      MemeModel(
        id: 8,
        title: 'Roblox Friends',
        description: "When your friend says they'll join you but takes forever: I'm waiting… ⏳😩",
      ),
      MemeModel(
        id: 9,
        title: 'Robx Inflation',
        description: "When you realize that 100 Robx doesn't buy what it used to: Inflation is real 📈🪙",
      ),
      MemeModel(
        id: 10,
        title: 'Roblox Builders',
        description: 'When you see a beautifully built game: I can barely build a box 🏛️😭',
      ),
      MemeModel(
        id: 11,
        title: 'Game Updates',
        description: 'When the game updates and you have to relearn everything: Why, Roblox, why? 😭🤯',
      ),
    ];
  }
}
