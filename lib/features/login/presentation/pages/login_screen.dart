import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_test/components/background.dart';
import 'package:technology_test/features/login/data/data_sources/api_services.dart';
import 'package:technology_test/features/login/presentation/widgets/components/login_form.dart';
import 'package:technology_test/features/login/presentation/widgets/components/login_screen_top_image.dart';
import 'package:technology_test/responsive.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ApiServices>(
      builder: (context, provider, child) {
        return Background(
          child: SingleChildScrollView(
            child: provider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Responsive(
                    mobile: const MobileLoginScreen(),
                    desktop: Row(
                      children: [
                        const Expanded(
                          child: const LoginScreenTopImage(),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 450,
                                child: LoginForm(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const LoginScreenTopImage(),
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 8,
                child: LoginForm(),
              ),
              const Spacer(),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.4),
        ],
      ),
    );
  }
}
