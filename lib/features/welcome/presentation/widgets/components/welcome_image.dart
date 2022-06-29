import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:technology_test/constants.dart';
import 'package:technology_test/features/login/data/data_sources/api_services.dart';

class WelcomeImage extends StatelessWidget {
  WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final con = Provider.of<ApiServices>(context, listen: false);
    return Column(
      children: [
        if (con.model != null && con.model.data != null)
          Text(
            "Welcome, ${con.model.data?.user?.name ?? 'Guest'}".toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        else
          Text(
            "WELCOME TO technologies".toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        const SizedBox(height: defaultPadding * 2),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: SvgPicture.asset(
                "assets/icons/chat.svg",
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
