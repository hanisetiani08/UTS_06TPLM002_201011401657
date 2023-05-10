import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HaniSetiani_201011401657',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
    );
  }
}

class HaniProduk {
  final String NamaBarang;
  final String gambar;
  final String deskripsi;
  final double hargabarang;

  HaniProduk(this.NamaBarang, this.gambar, this.deskripsi, this.hargabarang);
}

final List<HaniProduk> products = [
  HaniProduk(
      'Nike SB Zoom Blazer',
      'assets/images/sepatu1.png',
      'Mild Premium',
      88.0),
  HaniProduk(
      'Nike Air Zoom Pegasus',
      'assets/images/sepatu2.png',
      'Mens Rood Running Shoes',
      99.0),
  HaniProduk(
      'Nike ZoomX Vaporfly',
      'assets/images/sepatu3.png',
      'Mens Rood Racing Shoe',
      196.0),
  HaniProduk(
    'Nike Air Force 1 ',
      'assets/images/sepatu4.png',
      'Older Kids Shoe',
      200.0),
  HaniProduk(
      'Nike Waffle One',
      'assets/images/sepatu5.png',
      'Mens Shoes',
      75.0),
];

class ProductListScreen extends StatelessWidget {
  ProductListScreen({Key? key});

  final List<Color> colors = [
    Color.fromARGB(255, 182, 220, 252)!,
    Color.fromARGB(255, 252, 152, 152)!,
    Color.fromARGB(255, 241, 215, 135)!,
    Color.fromARGB(255, 136, 236, 139)!,
    Color.fromARGB(255, 252, 137, 177)!,

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: const [
                Text('Shoes',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                Spacer(),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/crown-10716.png'),
                  radius: 24.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: colors[index % colors.length],
                    borderRadius: BorderRadius.all(
                      Radius.circular(16)
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.NamaBarang,
                                style: const TextStyle(fontSize: 20.0)),
                            const SizedBox(height: 8.0),
                            Text(product.deskripsi),
                            const SizedBox(height: 8.0),
                            Text('${product.hargabarang}',
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Image.network(product.gambar,
                          width: 80.0, height: 80.0),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}