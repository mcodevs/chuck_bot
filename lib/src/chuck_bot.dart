import 'package:televerse/televerse.dart';

class ChuckBot {
  final Bot bot;
  final String chatId;

  ChuckBot({
    required String token,
    required this.chatId,
    LoggerOptions? loggerOptions,
    Duration? timeout,
  }) : bot = Bot.local(
          token,
          loggerOptions: loggerOptions,
          timeout: timeout,
        );

  static void initialize({
    required String token,
    required String chatId,
  }) {
    _instance ??= ChuckBot(
      token: token,
      chatId: chatId,
    );
  }

  static ChuckBot? _instance;

  static ChuckBot get instance {
    assert(
      _instance != null,
      "ChuckBot is not initialized. Use [ChuckBot.initialize()] in main function to initialize the bot.",
    );
    return _instance!;
  }

  Future<void> recordError(
    Object e, [
    StackTrace? stackTrace,
  ]) async {
    await bot.api.sendMessage(
      SupergroupID(chatId),
      _formatError(e, stackTrace),
    );
  }

  String _formatError(Object e, [StackTrace? stackTrace]) {
    return "$e\n$stackTrace";
  }
}
