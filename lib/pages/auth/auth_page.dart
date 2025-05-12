import 'package:flutter/material.dart';
import 'package:cube_games_store/components/auth/auth_response_component.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with
        TickerProviderStateMixin // <-- for AnimatedSize
        {
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
    final titleText = isLoginMode ? 'LOGIN CUBE GAMES' : 'SIGN UP CUBE GAMES';
    final subText = isLoginMode ? 'Welcome back!' : 'Join us for epic journey';
    final buttonText = isLoginMode ? 'LOGIN' : 'SIGN UP';
    final toggleText =
        isLoginMode ? "Don't have an account? " : "Have an account? ";
    final toggleTextLink = isLoginMode ? "Sign Up" : "Login";

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              // 1) cross-fade entire form on mode change
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
                      const Placeholder(fallbackHeight: 100),
                      const SizedBox(height: 16),

                      // 2) animate title style change
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: Text(
                          titleText,
                          key: ValueKey(titleText),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),

                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: Text(
                          subText,
                          key: ValueKey(subText),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 32),

                      _buildField(
                        controller: _usernameController,
                        label: 'Username',
                        hint: 'Enter username',
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
                                  hint: 'Enter email',
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
                        hint: 'Enter password',
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
                      ElevatedButton(
                        onPressed: _submitAuth,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child:
                            isLoading
                                ? const CircularProgressIndicator()
                                : Text(buttonText),
                      ),
                      const SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(toggleText),
                          InkWell(
                            onTap: _toggleMode,
                            child: Text(
                              toggleTextLink,
                              style: const TextStyle(color: Colors.blue),
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
          Text(label),
          const SizedBox(height: 4),
          TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            obscureText: obscure,
            validator: validator,
            decoration: InputDecoration(
              prefixIcon: Icon(icon),
              hintText: hint,
              border: const OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
