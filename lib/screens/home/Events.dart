import 'package:flutter/material.dart';
import 'package:kablosuzbeyin/models/Recommendations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Events extends StatelessWidget {
  final _pageController = PageController(viewportFraction: 0.877);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 3.0,
        title: Text("Olaylar olaylaaaaaaaaaaaaar"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    margin: EdgeInsets.only(
                      top: 18,
                    ),
                    child: Text(
                      'Takip Ettiğin Kanallardan Etkinlikler',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 0),
                height: 220,
                margin: EdgeInsets.only(top: 15),
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    recommendations.length,
                    (index) => GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 40,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(recommendations[index].image),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25, top: 20),
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: recommendations.length,
                      effect: ExpandingDotsEffect(
                          dotHeight: 4.5,
                          dotWidth: 6,
                          spacing: 4.5,
                          activeDotColor: Theme.of(context).primaryColor,
                          dotColor: Colors.grey),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text("Tüm Etkinlikler")
            ],
          ),
        ),
      ),
    );
  }
}
