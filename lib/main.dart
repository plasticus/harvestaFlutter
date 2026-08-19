import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/database_provider.dart';
import 'providers/game_state_provider.dart';
import 'screens/new_game_screen.dart';
import 'screens/corp_hq_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: HarVestaApp()));
}

class HarVestaApp extends StatelessWidget {
  const HarVestaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'harVesta',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF080C10),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00D4FF), // harVesta Cyan
          secondary: Color(0xFFFFB740), // harVesta Amber
          surface: Color(0xFF0D1520),
          error: Color(0xFFFF4D6A),
          onPrimary: Color(0xFF080C10),
          onSecondary: Color(0xFF080C10),
          onSurface: Color(0xFFC8DFF0),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF060A10),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Color(0xFF00D4FF),
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        cardTheme: const CardThemeData(
          color: Color(0xFF0D1520),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0xFF1A3050)),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFFC8DFF0)),
          bodyLarge: TextStyle(color: Color(0xFFC8DFF0)),
        ),
      ),
      home: const RootGateScreen(),
    );
  }
}

class RootGateScreen extends ConsumerStatefulWidget {
  const RootGateScreen({super.key});

  @override
  ConsumerState<RootGateScreen> createState() => _RootGateScreenState();
}

class _RootGateScreenState extends ConsumerState<RootGateScreen> {
  bool _bootstrapping = true;

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    try {
      final seeder = ref.read(databaseSeederProvider);
      await seeder.seedAll();

      await ref.read(gameStateProvider.notifier).initialize();
    } catch (e, stack) {
      if (kDebugMode) {
        print('Bootstrap error: $e\n$stack');
      }
    } finally {
      if (mounted) {
        setState(() => _bootstrapping = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_bootstrapping) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'harVesta',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4.0,
                  color: Color(0xFF00D4FF),
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Tactical Asteroid Mining & Fleet Management',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF5A7A9A),
                  letterSpacing: 1.0,
                ),
              ),
              SizedBox(height: 32),
              SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Color(0xFF00D4FF),
                  strokeWidth: 2,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final gameState = ref.watch(gameStateProvider);
    if (gameState.isCommissioned) {
      return const CorpHqScreen();
    } else {
      return const NewGameScreen();
    }
  }
}
