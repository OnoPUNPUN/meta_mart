import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meta_mart/core/theme/app_colors.dart';
import 'package:meta_mart/core/utils/show_snackbar.dart';
import 'package:meta_mart/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:meta_mart/features/auth/presentation/pages/login_page.dart';
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

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          showSnackbar(context, state.message);
        } else if (state is AuthRegisterSuccess) {
          showSnackbar(context, 'Account created successfully');
          context.push(LoginPage.name);
        }
      },
      child: AuthPageShell(
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
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
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
                  hintText: 'Create a password',
                  obscureText: _isPasswordObscured,
                  textInputAction: TextInputAction.next,
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
                const SizedBox(height: 18),
                AuthTextField(
                  controller: _confirmPasswordTEController,
                  label: 'Confirm password',
                  hintText: 'Repeat your password',
                  obscureText: _isConfirmPasswordObscured,
                  textInputAction: TextInputAction.done,
                  prefixIcon: Icons.lock_outline_rounded,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordTEController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordObscured =
                            !_isConfirmPasswordObscured;
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
                    if (_formKey.currentState?.validate() ?? false) {
                      if (!_acceptedTerms) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Please accept the terms and privacy policy',
                            ),
                          ),
                        );
                        return;
                      }

                      context.read<AuthBloc>().add(
                        RegisterEvent(
                          name: _nameTEController.text.trim(),
                          email: _emailTEController.text.trim(),
                          password: _passwordTEController.text,
                          avatar: '',
                        ),
                      );
                    }
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
      ),
    );
  }
}

typedef SingupPage = SignupPage;
