import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/carousel_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _controller = PageController(viewportFraction: 0.55);
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 400,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(
                width: 10,
                color: Colors.black.withValues(alpha: 0.2),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Choose your starting widgets",
                    style: GoogleFonts.luckiestGuy(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      final offset = _currentPage - index;
                      return CarouselCard(index: index, offset: offset);
                    },
                  ),
                ),
                Icon(Icons.swipe_right_outlined, color: Colors.blueGrey),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Swipe through and pick the pack that best describes what you're looking for.",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
