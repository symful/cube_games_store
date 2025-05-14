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

  void _toggleMode() => setState(() {
    isLoginMode = !isLoginMode;
    isAuthFinished = false;
  });

  Future<void> _submitAuth() async {
    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isLoading = false;
      isAuthFinished = true;
    });
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
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder:
                    (child, anim) =>
                        FadeTransition(opacity: anim, child: child),
                child: SingleChildScrollView(
                  key: ValueKey(isLoginMode),
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
                        child: Text(
                          subText,
                          key: ValueKey(subText),
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Russo One',
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 32),

                      _buildField(
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

                      // 3) animate the appearance/disappearance of email field
                      AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        alignment: Alignment.topCenter,
                        child:
                            isLoginMode
                                ? const SizedBox.shrink()
                                : _buildField(
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

                      _buildField(
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
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            toggleText,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          InkWell(
                            onTap: _toggleMode,
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          if (isAuthFinished)
            AuthResponseComponent(
              isLogin: isLoginMode,
              username: _usernameController.text,
            ),
        ],
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool obscure = false,
    TextInputType? keyboardType,
    FormFieldValidator<String>? validator,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            obscureText: obscure,
            validator: validator,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Color(0xff969696)),
              hintText: hint,
              hintStyle: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12,
                color: Color(0xff969696),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
