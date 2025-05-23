import 'package:cube_games_store/components/auth/auth_field.dart';
import 'package:cube_games_store/components/custom_icons/logo_icon.dart';
import 'package:flutter/material.dart';
import 'package:cube_games_store/components/auth/auth_response_component.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with TickerProviderStateMixin {
  bool isLoginMode = true;
  bool isAuthFinished = false;
  bool isLoading = false;
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _toggleMode() => setState(() {
    isLoginMode = !isLoginMode;
    isAuthFinished = false;
  });

  Future<void> _submitAuth() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        isLoading = false;
        isAuthFinished = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final titleText = isLoginMode ? 'LOGIN\nCUBE GAMES' : 'SIGN UP\nCUBE GAMES';
    final subText = isLoginMode ? 'Welcome back!' : 'Join us for epic journey';
    final buttonText = isLoginMode ? 'LOGIN' : 'SIGN UP';
    final toggleText =
        isLoginMode ? "Don't have an account? " : "Have an account? ";
    final toggleTextLink = isLoginMode ? "Sign Up" : "Login";

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(width: 82, height: 80, child: LogoIcon()),
                      const SizedBox(height: 16),

                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: Text(
                          titleText,
                          key: ValueKey(titleText),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 36,
                            fontFamily: 'Revamped',
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),

                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        key: ValueKey(subText),
                        child: Text(
                          subText,
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Russo One',
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 32),

                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (
                          Widget child,
                          Animation<double> animation,
                        ) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                        child:
                            isLoginMode
                                ? const SizedBox.shrink()
                                : AuthField(
                                  controller: _emailController,
                                  label: 'Email',
                                  keyboardType: TextInputType.emailAddress,
                                  hint: 'email@gmail.com',
                                  icon: Icons.email,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    if (!RegExp(
                                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                                    ).hasMatch(value)) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                      ),

                      AuthField(
                        controller: _usernameController,
                        label: 'Username',
                        hint: 'username',
                        icon: Icons.person,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          if (value.length < 3) {
                            return 'Username must be at least 3 characters';
                          }
                          return null;
                        },
                      ),

                      AuthField(
                        controller: _passwordController,
                        label: 'Password',
                        hint: 'password',
                        icon: Icons.lock,
                        obscure: true,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 24),
                      SizedBox(
                        height: 42,
                        child: ElevatedButton(
                          onPressed: _submitAuth,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                          ),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child:
                                isLoading
                                    ? const CircularProgressIndicator(
                                      constraints: BoxConstraints(
                                        maxHeight: 24,
                                        maxWidth: 24,
                                        minHeight: 24,
                                        minWidth: 24,
                                      ),
                                    )
                                    : Text(
                                      buttonText,
                                      key: ValueKey(buttonText),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: Text(
                              toggleText,
                              key: ValueKey(toggleText),
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: InkWell(
                              onTap: _toggleMode,
                              key: ValueKey(toggleTextLink),
                              child: Text(
                                toggleTextLink,
                                style: const TextStyle(
                                  color: Color(0xff65EF23),
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child:
                isAuthFinished
                    ? AuthResponseComponent(
                      key: ValueKey('auth_response'),
                      isLogin: isLoginMode,
                      username: _usernameController.text,
                    )
                    : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
