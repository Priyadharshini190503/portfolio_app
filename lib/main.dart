import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  void openWhatsApp() async {
    final phone = "+919876543210";
    final message = "Hello Priyadharshini!";
    final url = "https://wa.me/$phone?text=${Uri.encodeComponent(message)}";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch WhatsApp");
    }
  }

  void openResume() async {
    final url = "https://example.com/my_resume.pdf";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not open resume");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 30 : 60,
            vertical: isMobile ? 50 : 60,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              Text(
                "Hi! I'm Priyadharshini",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 18 : 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),

              CircleAvatar(
                radius: isMobile ? 50 : 70,
                backgroundImage: const AssetImage("assets/profile.jpg"),
              ),
              const SizedBox(height: 20),

              Text(
                "Full Stack Developer",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 22 : 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: isMobile ? 400 : 800),
                child: Text(
                  "I am a Full Stack Developer based in Chennai, India, with 6 months of professional experience building modern web applications using React, Express, and MongoDB. Currently, I am expanding my expertise into Flutter to create high-quality mobile applications, delivering seamless cross-platform experiences.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: isMobile ? 13 : 15,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 15,
                runSpacing: 15,
                children: [
                  ElevatedButton(
                    onPressed: openWhatsApp,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 55 : 620,  // use smaller padding for mobile
                        vertical: isMobile ? 12 : 18,
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.pink, Colors.orange]),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints(minWidth: 140),
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Text("Contact Me", style: TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ),
                  ),

                  OutlinedButton.icon(
                    onPressed: openResume,
                    icon: Icon(Icons.download, color: Colors.white),
                    label: Text("My Resume", style: TextStyle(color: Colors.white, fontSize: 16)),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
