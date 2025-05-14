import 'package:cube_games_store/components/custom_icons/success_icon.dart';
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
    return Stack(
      children: [
        Positioned.fill(
          child: Container(color: Colors.black.withValues(alpha: 0.45)),
        ),
        Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return FittedBox(
                child: Theme(
                  data: popupTheme,
                  child: Material(
                    type: MaterialType.transparency,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(36.0),
                        color: popupTheme.scaffoldBackgroundColor,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SuccessIcon(),
                                const SizedBox(height: 16),
                                Text(
                                  titleText,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'Russo One',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    username,
                                    style: TextStyle(
                                      fontFamily: 'Russo One',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff595959),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const HomePage(),
                                      ),
                                    );
                                  },

                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2.0,
                                      horizontal: 8,
                                    ),

                                    child: Text(
                                      'CONTINUE',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
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
            },
          ),
        ),
      ],
    );
  }
}
