import 'package:cube_games_store/theme.dart';
import 'package:flutter/material.dart';
import 'package:cube_games_store/pages/home/home_page.dart';

class AuthResponseComponent extends StatelessWidget {
  final bool isLogin;
  final String username;

  const AuthResponseComponent({
    super.key,
    required this.isLogin,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    final titleText = isLogin ? 'WELCOME BACK' : 'WELCOME NEW USER';
    return Center(
      child: FittedBox(
        child: Theme(
          data: lightTheme,
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              color: lightTheme.scaffoldBackgroundColor,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Placeholder(fallbackHeight: 100),
                      const SizedBox(height: 16),
                      Text(titleText, style: const TextStyle(fontSize: 24)),
                      Text(username),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const HomePage()),
                          );
                        },
                        child: const Text('CONTINUE'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
