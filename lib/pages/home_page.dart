import 'package:flutter/material.dart';
import 'package:mukund_flutter/pages/detail_page.dart';
import 'package:mukund_flutter/widgets/my_bottom_app_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///User profile
              Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Container(
                    color: Colors.indigoAccent.shade700,
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.indigoAccent.withOpacity(
                                      0.4,
                                    ),
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                              child: Icon(
                                Icons.notification_add_outlined,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                          child: Text(
                            'Good Morning and stay healthy',
                            style: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                          child: Text(
                            'Hi Jenny, how are you?',
                            style: TextStyle(
                              color: Colors.grey.shade300,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///Search
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: const EdgeInsetsDirectional.only(
                        top: 160,
                      ),
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.search,
                              size: 24,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration.collapsed(
                                  border: InputBorder.none,
                                  hintText: 'Search Doctor or Symptom',
                                ),
                                autofocus: false,
                                maxLines: 1,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.filter_list_sharp,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                width: 16,
              ),

              ///Categories
              _categoriesWidget(),
              const SizedBox(
                width: 16,
              ),

              ///Recommended Doctors
              _recommendedDoctorsWidget(),
              const SizedBox(
                width: 32,
              ),

              ///Consultation Schedule
              _consultationScheduleWidget(),
              const SizedBox(
                width: 120,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 24.0),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _categoriesWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            'Categories',
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(
          width: 32,
        ),
        SizedBox(
          height: 110,
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) => _categoriesItems(index),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) => const Divider(
              indent: 16,
              color: Colors.transparent,
            ),
            itemCount: 8,
          ),
        ),
      ],
    );
  }

  _categoriesItems(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(64), color: Colors.white),
            height: 64,
            width: 64,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.remove_red_eye_sharp,
                color: Colors.indigoAccent.withOpacity(
                  0.2,
                ),
                size: 32,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text('Eyes'),
        ],
      ),
    );
  }

  _recommendedDoctorsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recommended Doctor\'s',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const Text(
                'See All',
                style: TextStyle(
                  color: Colors.indigoAccent,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 32,
        ),
        SizedBox(
          height: 220,
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) => _recommendedItems(index),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) => const Divider(
              indent: 2,
            ),
            itemCount: 6,
          ),
        ),
      ],
    );
  }

  _recommendedItems(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
        },
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Container(
                    height: 140,
                    width: 152,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                      color: Colors.blueGrey.shade300,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.person_4_outlined,
                        color: Colors.white,
                        size: 64,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 110,
                    top: 8,
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.indigoAccent,
                      size: 32,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Dr. Amelia Daniel',
                      style: TextStyle(
                        color: Colors.indigoAccent,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Dermatologist',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _consultationScheduleWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Consultation Schedule',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const Text(
                'See All',
                style: TextStyle(
                  color: Colors.indigoAccent,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 32,
        ),
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => _consultationItems(index),
          separatorBuilder: (BuildContext context, int index) => const Divider(
            indent: 2,
          ),
          itemCount: 2,
        ),
        const SizedBox(
          width: 32,
        ),
      ],
    );
  }

  _consultationItems(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  color: Colors.blueGrey.shade300,
                ),
                child: const Center(
                  child: Icon(
                    Icons.person_4_outlined,
                    color: Colors.white,
                    size: 64,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dr. Amelia Daniel',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Dermatologist',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
