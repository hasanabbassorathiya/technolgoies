import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_test/components/background.dart';
import 'package:technology_test/features/login/data/data_sources/api_services.dart';
import 'package:technology_test/features/login/data/models/user_model.dart';
import 'package:technology_test/features/welcome/presentation/pages/welcome_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Background(
        child: SingleChildScrollView(
          child: Consumer<ApiServices>(
            builder: (context, provider, child) {
              User? userModel = provider.model.data?.user;
              return Column(
                children: [
                  Card(
                    color: Colors.purple,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Name: ',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: (userModel?.name ?? 'Guest').toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Phone: ',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: (userModel?.phone ?? 123456789)
                                      .toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: ElevatedButton(
                          onPressed: () {
                            provider.model = UserModel();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return WelcomeScreen();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Go Back".toUpperCase(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
