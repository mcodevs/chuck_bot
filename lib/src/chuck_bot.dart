import 'package:televerse/televerse.dart';

class ChuckBot {
  final Bot bot;

  ChuckBot({
    required String token,
    LoggerOptions? loggerOptions,
    Duration? timeout,
  }) : bot = Bot(
          token,
          loggerOptions: loggerOptions,
          timeout: timeout,
        );

  static Future<void> initialize({
    required String token,
  }) async {
    _instance ??= ChuckBot(token: token);
    await instance.start();
  }

  static ChuckBot? _instance;

  static ChuckBot get instance {
    assert(
      _instance != null,
      "ChuckBot is not initialized. Use [ChuckBot.initialize()] in main function to initialize the bot.",
    );
    return _instance!;
  }

  Future<void> start() async => await bot.start();

  Future<void> recordError(
    Object e, [
    StackTrace? stackTrace,
  ]) async {
    await bot;
  }

  String _formatError(Object e, [StackTrace? stackTrace]) {
    return "$e\n$stackTrace";
  }
}
