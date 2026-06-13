import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_assets.dart';
import 'package:soonstays/core/constants/app_text_styles.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/common_appbar.dart';
import '../controllers/legal_policy_controller.dart';

class LegalPolicyView extends GetView<LegalPolicyController> {
  const LegalPolicyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FC),
      appBar: CommonAppBar(
          title: "Legal & Policy",
          isActionTrue: true
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              const _HeaderSection(),

              const SizedBox(height: 16),

              const _InfoCard(),

              const SizedBox(height: 16),

              const _PrivacyCard(),

              const SizedBox(height: 16),

              const _OnThisPageCard(),

              const SizedBox(height: 16),

              const _BottomInfoCard(),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [

            AppColors.primary,

            AppColors.blue,

            AppColors.primary3,

          ],
        ),

        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [

          Expanded(
            child: Text(
              "ADH Hospitality Pvt Ltd - SoonStays",
              style: AppTextStyle.white20Bold,
            ),
          ),

          Image.asset(
            "${AppAssets.legalPolicy}",
            height: 80,
          ),
        ],
      ),
    );
  }
}

Widget commonCard({
  required Widget child,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16),

    padding: const EdgeInsets.all(18),

    decoration: BoxDecoration(
      color: Colors.white,

      borderRadius: BorderRadius.circular(24),

      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.05),
          blurRadius: 15,
          offset: const Offset(0, 6),
        ),
      ],
    ),

    child: child,
  );
}


class _InfoCard extends StatelessWidget {
  const _InfoCard();

  @override
  Widget build(BuildContext context) {
    return commonCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          _iconCircle(Icons.info),

          const SizedBox(width: 15),

          const Expanded(
            child: Text(
              "This document is an electronic record in accordance with the Information Technology Act, 2000 and applicable rules thereunder.",
              style: AppTextStyle.black13Regular,
            ),
          ),
        ],
      ),
    );
  }
}

class _AgreementCard extends StatelessWidget {
  const _AgreementCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F1FF),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [

          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.handshake_outlined,
              color: Color(0xFF5B45FF),
            ),
          ),

          const SizedBox(width: 15),

          const Expanded(
            child: Text(
              "By using SoonStays, you agree to the terms described in this Privacy Policy.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
          ),

          const SizedBox(width: 10),

          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.verified_user_outlined,
              color: Color(0xFF5B45FF),
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class _PrivacyCard extends StatelessWidget {
  const _PrivacyCard();

  @override
  Widget build(BuildContext context) {
    return commonCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          _iconCircle(Icons.shield_outlined),

          const SizedBox(width: 15),

          const Expanded(
            child: Text(
              "This Privacy Policy explains how ADH Hospitality Pvt Ltd collects, uses, stores and protects user information.",
              style: AppTextStyle.black13Regular,
            ),
          ),
        ],
      ),
    );
  }
}


class _OnThisPageCard extends StatelessWidget {
  const _OnThisPageCard();

  final List<String> items = const [
    "Information We Collect",
    "How We Use Your Information",
    "Information Sharing & Disclosure",
    "Data Security",
    "Your Rights & Choices",
    "Cookies & Tracking Technologies",
    "Changes to This Policy",
    "Contact Us",
  ];

  @override
  Widget build(BuildContext context) {
    return commonCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "On this page",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 15),

          ...List.generate(
            items.length,
                (index) => ListTile(
              contentPadding: EdgeInsets.zero,

              leading: _iconCircle(Icons.description),

              title: Text(
                "${index + 1}. ${items[index]}",
              ),

              trailing: const Icon(
                Icons.chevron_right,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _BottomInfoCard extends StatelessWidget {
  const _BottomInfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.lightBg,
        borderRadius: BorderRadius.circular(20),
      ),

      child: const Row(
        children: [

          Icon(
            Icons.lock,
            color: AppColors.blue,
          ),

          SizedBox(width: 15),

          Expanded(
            child: Text(
              "Your privacy is important to us. We are committed to protecting your personal information.",
              style: AppTextStyle.black13Regular,
            ),
          ),
        ],
      ),
    );
  }
}


Widget _iconCircle(IconData icon) {
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      color: AppColors.lightBg,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Icon(
      icon,
      color: AppColors.blue,
    ),
  );
}

Widget _circleButton(IconData icon) {
  return Container(
    height: 50,
    width: 50,

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      border: Border.all(
        color: Colors.white24,
      ),
    ),

    child: Icon(
      icon,
      color: Colors.white,
    ),
  );
}