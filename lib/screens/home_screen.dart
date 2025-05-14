import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
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

            child: Column(
              children: [
                Image.asset('assets/images/cat.png', width: 72),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Choose your starting widgets",
                    style: GoogleFonts.luckiestGuy(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 35),
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
                SizedBox(height: 35),
                Icon(Icons.swipe_right_outlined, color: Colors.blueGrey),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Swipe through and pick the pack that best describes what you're looking for.",
                    textAlign: TextAlign.center,
                  ),
                ),
                TextButton(
                  onPressed: _launchURL,
                  child: Text("Made by @Henselldev"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final Uri _url = Uri.parse('https://hensell.dev');

Future<void> _launchURL() async {
  if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
    throw Exception('No se pudo abrir $_url');
  }
}
