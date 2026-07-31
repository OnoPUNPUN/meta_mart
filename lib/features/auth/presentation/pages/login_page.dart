import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meta_mart/core/theme/app_colors.dart';
import 'package:meta_mart/core/utils/show_snackbar.dart';
import 'package:meta_mart/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:meta_mart/features/auth/presentation/pages/singup_page.dart';
import 'package:meta_mart/features/home/presentation/pages/home_page.dart';
import 'package:meta_mart/features/auth/presentation/widgets/auth_page_shell.dart';
import 'package:meta_mart/features/auth/presentation/widgets/auth_primary_button.dart';
import 'package:meta_mart/features/auth/presentation/widgets/auth_social_button.dart';
import 'package:meta_mart/features/auth/presentation/widgets/auth_switch_prompt.dart';
import 'package:meta_mart/features/auth/presentation/widgets/auth_text_field.dart';

class LoginPage extends StatefulWidget {
  static const name = "/login-page";

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailTEController = TextEditingController();
  final _passwordTEController = TextEditingController();
  bool _isPasswordObscured = true;

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          showSnackbar(context, state.message);
        } else if (state is AuthSuccess) {
          context.push(HomePage.name);
        }
      },
      child: AuthPageShell(
        title: 'Welcome back',
        subtitle: 'Sign in to continue shopping your favourite tech.',
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AuthTextField(
                  controller: _emailTEController,
                  label: 'Email',
                  hintText: 'michael@email.com',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  prefixIcon: Icons.mail_outline_rounded,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email is required';
                    }
                    final emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );
                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                AuthTextField(
                  controller: _passwordTEController,
                  label: 'Password',
                  hintText: 'Enter your password',
                  obscureText: _isPasswordObscured,
                  textInputAction: TextInputAction.done,
                  prefixIcon: Icons.lock_outline_rounded,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordObscured = !_isPasswordObscured;
                      });
                    },
                    icon: Icon(
                      _isPasswordObscured
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password?',
                      style: textTheme.bodySmall?.copyWith(
                        color: AppColors.contentPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                AuthPrimaryButton(
                  label: 'Sign in',
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      context.read<AuthBloc>().add(
                        LoginEvent(
                          email: _emailTEController.text.trim(),
                          password: _passwordTEController.text,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          const _AuthDivider(),
          const SizedBox(height: 20),
          AuthSocialButton(
            icon: Icons.g_mobiledata_rounded,
            label: 'Continue with Google',
            onPressed: () {},
          ),
          const SizedBox(height: 28),
          AuthSwitchPrompt(
            text: 'New to MetaMart?',
            actionText: 'Create account',
            onPressed: () {
              context.push(SingupPage.name);
            },
          ),
        ],
      ),
    );
  }
}

class _AuthDivider extends StatelessWidget {
  const _AuthDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text('or', style: Theme.of(context).textTheme.bodySmall),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}
