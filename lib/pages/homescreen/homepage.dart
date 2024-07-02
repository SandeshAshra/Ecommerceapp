import 'package:ecommerceapp/brandsdata.dart';
import 'package:ecommerceapp/pages/homescreen/productcard.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/models/brand.dart';
import 'package:ecommerceapp/models/product.dart';
import 'package:ecommerceapp/pages/homescreen/cart_screen.dart';
import 'package:ecommerceapp/widgets/brandbutton.dart';
import 'package:ecommerceapp/widgets/productcard.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import 'user_profile.dart';
import 'notification_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex1 = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> pages = [
    HomeScreen(),
    CartScreen(),
    NotificationScreen(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex1 = index;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return WaterDropNavBar(
      backgroundColor: Colors.white,
      bottomPadding: MediaQuery.of(context).size.height * 0.02,
      waterDropColor: Theme.of(context).colorScheme.primary,
      selectedIndex: selectedIndex1,
      onItemSelected: (index) {
        setState(() {
          selectedIndex1 = index;
        });
        _pageController.jumpToPage(index);
      },
      barItems: [
        BarItem(
          filledIcon: Icons.home,
          outlinedIcon: Icons.home_outlined,
        ),
        BarItem(
          filledIcon: Icons.shopping_bag,
          outlinedIcon: Icons.shopping_bag_outlined,
        ),
        BarItem(
          filledIcon: Icons.notifications,
          outlinedIcon: Icons.notifications_outlined,
        ),
        BarItem(
          filledIcon: Icons.person,
          outlinedIcon: Icons.person_outline,
        ),
      ],
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filterProductsByBrand(selectedIndex);
  }

  void filterProductsByBrand(int index) {
    setState(() {
      selectedIndex = index;
      if (index == 0) {
        // "All" category
        filteredProducts = products;
      } else {
        // Specific brand
        filteredProducts = products.where((product) => product.brand == brands[selectedIndex].name).toList();
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topBar(context),
            _title(),
            _searchField(context),
            _categoriesList(context),
            _productsGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _topBar(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=62"),
          )
        ],
      ),
    );
  }

  Widget _title() {
    return const Text.rich(TextSpan(children: [
      TextSpan(
        text: "Discover\n",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      TextSpan(
        text: "Get the best sneakers here",
        style: TextStyle(
          color: Colors.black26,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      )
    ]));
  }

  Widget _searchField(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.04,
      ),
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Icon(
            Icons.search,
            color: Colors.black26,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.80,
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search your favorites",
                hintStyle: TextStyle(
                  color: Colors.black26,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoriesList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        itemBuilder: (context, index) {
          Brand brand = brands[index];
          return GestureDetector(
            onTap: () {
              filterProductsByBrand(index);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: BrandButton(brand: brand, isSelected: selectedIndex == index),
            ),
          );
        },
      ),
    );
  }

  Widget _productsGrid(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          Product product = filteredProducts[index];
          return ProductCard(
            product: product,
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02,
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProductPage(product: product);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
