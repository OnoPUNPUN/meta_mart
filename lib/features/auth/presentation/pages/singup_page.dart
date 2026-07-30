import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meta_mart/core/theme/app_colors.dart';
import 'package:meta_mart/features/auth/presentation/widgets/auth_page_shell.dart';
import 'package:meta_mart/features/auth/presentation/widgets/auth_primary_button.dart';
import 'package:meta_mart/features/auth/presentation/widgets/auth_switch_prompt.dart';
import 'package:meta_mart/features/auth/presentation/widgets/auth_text_field.dart';

class SignupPage extends StatefulWidget {
  static const name = "/singup-page";
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameTEController = TextEditingController();
  final _emailTEController = TextEditingController();
  final _passwordTEController = TextEditingController();
  final _confirmPasswordTEController = TextEditingController();
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;
  bool _acceptedTerms = true;

  @override
  void dispose() {
    _nameTEController.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AuthPageShell(
      title: 'Create account',
      subtitle:
          'Join MetaMart and keep your carts, favourites, and orders in sync.',
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AuthTextField(
                controller: _nameTEController,
                label: 'Full name',
                hintText: 'Michael Jordan',
                textInputAction: TextInputAction.next,
                prefixIcon: Icons.person_outline_rounded,
              ),
              const SizedBox(height: 18),
              AuthTextField(
                controller: _emailTEController,
                label: 'Email',
                hintText: 'michael@email.com',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                prefixIcon: Icons.mail_outline_rounded,
              ),
              const SizedBox(height: 18),
              AuthTextField(
                controller: _passwordTEController,
                label: 'Password',
                hintText: 'Create a password',
                obscureText: _isPasswordObscured,
                textInputAction: TextInputAction.next,
                prefixIcon: Icons.lock_outline_rounded,
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
              const SizedBox(height: 18),
              AuthTextField(
                controller: _confirmPasswordTEController,
                label: 'Confirm password',
                hintText: 'Repeat your password',
                obscureText: _isConfirmPasswordObscured,
                textInputAction: TextInputAction.done,
                prefixIcon: Icons.lock_outline_rounded,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
                    });
                  },
                  icon: Icon(
                    _isConfirmPasswordObscured
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  setState(() {
                    _acceptedTerms = !_acceptedTerms;
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _acceptedTerms,
                      onChanged: (value) {
                        setState(() {
                          _acceptedTerms = value ?? false;
                        });
                      },
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'I agree to the terms and privacy policy.',
                          style: textTheme.bodySmall?.copyWith(
                            color: AppColors.contentSecondary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              AuthPrimaryButton(
                label: 'Create account',
                onPressed: () {
                  _formKey.currentState?.validate();
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        AuthSwitchPrompt(
          text: 'Already have an account?',
          actionText: 'Sign in',
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            }
          },
        ),
      ],
    );
  }
}

typedef SingupPage = SignupPage;
