import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Screens/Carpenter_detail/carpenter_info.dart';
import 'package:furniture_app/Screens/home_screen/message.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imageList = [
    'assets/images/home1.jpg',
    'assets/images/home.jpg',
    'assets/images/home_page.jpg',
    'assets/images/furniture1.jpg',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Column(
          children: [
            Container(
              color: const Color(0xFF9B6B41),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.04),
                  Text(
                    "Dream Furniture",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.search, color: Color(0xFF9B6B41)),
                                SizedBox(width: 8),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Search...",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        Stack(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Message()));
                              },
                              icon: const Icon(Icons.mail,
                                  size: 55, color: Colors.white),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: const Text(
                                  '1',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 3),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
          color: Color(0xFF9B6B41),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (index) {
            final icons = [
              Icons.home,
              Icons.qr_code,
              Icons.person,
              Icons.settings
            ];
            final labels = ['Home', 'Scan', 'Profile', 'Settings'];

            return GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = index;
                });

                switch (index) {
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Message()),
                    );
                    break;

                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CarpenterInfo()),
                    );
                    break;

                  case 2:
                    break;

                  case 3:
                    break;
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icons[index],
                    size: 28,
                    color: _currentIndex == index
                        ? Colors.white
                        : const Color.fromARGB(182, 255, 255, 255),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    labels[index],
                    style: TextStyle(
                      color: _currentIndex == index
                          ? Colors.white
                          : Colors.white54,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("New Arrival",
                  style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold)),
              const Text("See the latest ideas and purchase",
                  style: TextStyle(color: Colors.grey)),
              SizedBox(height: screenHeight * 0.02),
              CarouselSlider(
                options: CarouselOptions(
                  height: screenWidth * 0.5,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                ),
                items: imageList.map((imagePath) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(imagePath, fit: BoxFit.cover),
                  );
                }).toList(),
              ),
              SizedBox(height: screenHeight * 0.03),
              Text("Find new trends and some inspiration",
                  style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: screenHeight * 0.02),
              Wrap(
                spacing: screenWidth * 0.02,
                runSpacing: screenHeight * 0.01,
                children: [
                  "home1.jpg",
                  "home2.jpg",
                  "furniture2.jpg",
                  "furniture1.jpg",
                  "home_page.jpg",
                  "home.jpg"
                ].map((file) {
                  return SizedBox(
                    width: screenWidth * 0.28,
                    height: screenHeight * 0.1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child:
                          Image.asset("assets/images/$file", fit: BoxFit.cover),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset("assets/images/home2.jpg",
                          height: screenHeight * 0.10, fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset("assets/images/home1.jpg",
                          height: screenHeight * 0.10, fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.search,
                        color: Color(0xFF9B6B41), size: 56),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Text("Notification",
                  style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: screenHeight * 0.01),
              notificationItem(
                  "Nature lover", "liked your post.", "56 min ago"),
              notificationItem(
                  "Nature lover", "Saved your post.", "57 min ago"),
            ],
          ),
        ),
      ),
    );
  }

  Widget notificationItem(String user, String action, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const CircleAvatar(
              backgroundImage: AssetImage("assets/images/home1.jpg")),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                      text: "$user ",
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "$action"),
                ],
              ),
            ),
          ),
          Text(time, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
