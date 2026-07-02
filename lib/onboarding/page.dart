import 'package:cakrawala_app/services/preferences_service.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _slides = const [
    OnboardingData(
      title: 'Selamat Datang di Cakrawala',
      description:
          'Temukan keindahan alam dan petualangan tanpa batas langsung dari genggaman tangan Anda.',
      icon: Icons.explore_rounded,
      color: Color(0xFF1e3c72),
    ),
    OnboardingData(
      title: 'Rencanakan Perjalanan',
      description:
          'Atur destinasi impian Anda secara praktis dan temukan rekomendasi tempat wisata terbaik.',
      icon: Icons.map_rounded,
      color: Color(0xFF2a5298),
    ),
    OnboardingData(
      title: 'Mulai Petualangan',
      description:
          'Bergabunglah dengan komunitas penjelajah lainnya dan ciptakan momen perjalanan yang tak terlupakan.',
      icon: Icons.rocket_launch_rounded,
      color: Color(0xFF2193b0),
    ),
  ];

  Future<void> _onFinishOnboarding() async {
    final navigator = Navigator.of(context);

    // Save to SharedPreferences that onboarding is completed
    await PreferencesService.setIsFirstLaunch(false);

    // Check if the user is already logged in
    final isLoggedIn = await PreferencesService.getIsLoggedIn();

    // Navigate to the appropriate screen
    if (isLoggedIn) {
      navigator.pushReplacementNamed('/');
    } else {
      navigator.pushReplacementNamed('/login');
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: _slides.length,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        itemBuilder: (context, index) {
          final slide = _slides[index];
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [slide.color, slide.color.withValues(alpha: 0.8)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                Icon(
                  slide.icon,
                  size: 120,
                  color: Colors.white,
                ),
                const SizedBox(height: 48),
                Text(
                  slide.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  slide.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    height: 1.5,
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          );
        },
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
        decoration: BoxDecoration(
          color: _slides[_currentPage].color.withValues(alpha: 0.95),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Slide indicator dots
            Row(
              children: List.generate(
                _slides.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(right: 8.0),
                  height: 8.0,
                  width: _currentPage == index ? 24.0 : 8.0,
                  decoration: BoxDecoration(
                    color:
                        _currentPage == index ? Colors.white : Colors.white54,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
            ),
            // Button to go to next or finish onboarding
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: _slides[_currentPage].color,
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                elevation: 4,
              ),
              onPressed: () {
                if (_currentPage < _slides.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                } else {
                  _onFinishOnboarding();
                }
              },
              child: Text(
                _currentPage == _slides.length - 1 ? 'Mulai' : 'Lanjut',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const OnboardingData({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}
