import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as myHttp;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: GoogleFonts.montserratTextTheme(),
          cardTheme: CardTheme(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController nomorMejaController = TextEditingController();
  final String urlMenu =
      "https://script.google.com/macros/s/AKfycbxWahWELhBHYPV54eREz4GvCwDdjSkrTHkeTXx8OLzdoC_rkTx0jskvHL5Fns6MxyC4/exec";

  Future<List<MenuModel>> getAllData() async {
    List<MenuModel> listMenu = [];
    var response = await myHttp.get(Uri.parse(urlMenu));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      for (var element in data) {
        listMenu.add(MenuModel.fromJson(element));
      }
    } else {
      throw Exception('Failed to load data');
    }

    return listMenu;
  }

  void openDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Pesanan Anda",
                    style: GoogleFonts.montserrat(fontSize: 18)),
                SizedBox(height: 20),
                TextFormField(
                  controller: namaController,
                  decoration: InputDecoration(
                    labelText: "Nama",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: nomorMejaController,
                  decoration: InputDecoration(
                    labelText: "Nomor Meja",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Consumer<CartProvider>(
                  builder: (context, value, _) {
                    return ElevatedButton(
                      onPressed: () async {
                        String nama = namaController.text.trim();
                        String nomorMeja = nomorMejaController.text.trim();

                        if (nama.isEmpty || nomorMeja.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text("Nama dan Nomor Meja wajib diisi")),
                          );
                          return;
                        }

                        String strPesanan = value.cart.map((element) {
                          return "${element.name} (${element.quantity})";
                        }).join(", ");

                        if (strPesanan.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text("Keranjang belanja kosong!")),
                          );
                          return;
                        }

                        final String message = Uri.encodeComponent(
                          'Nama: $nama\nNomor Meja: $nomorMeja\nPesanan:\n$strPesanan',
                        );

                        final String waUrl =
                            "https://wa.me/6281913089634?text=$message";

                        if (await canLaunch(waUrl)) {
                          await launch(waUrl);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text("Tidak dapat membuka WhatsApp")),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text("Pesan Sekarang"),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Consumer<CartProvider>(
        builder: (context, cart, child) {
          return FloatingActionButton(
            onPressed: openDialog,
            child: badges.Badge(
              badgeContent: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: Text(
                  cart.totalItems.toString(),
                  key: ValueKey<int>(cart.totalItems),
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
              child: Icon(Icons.shopping_bag, size: 30),
            ),
          );
        },
      ),
      body: SafeArea(
        child: FutureBuilder<List<MenuModel>>(
          future: getAllData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              List<MenuModel> menus = snapshot.data!;
              return ListView.builder(
                itemCount: menus.length,
                itemBuilder: (context, index) {
                  var menu = menus[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              menu.image,
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  menu.nama,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  menu.deskripsi,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "Rp ${menu.harga}",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon:
                                    Icon(Icons.add_circle, color: Colors.green),
                                onPressed: () {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .addRemove(menu.id, menu.nama, true);
                                },
                              ),
                              SizedBox(height: 4),
                              Consumer<CartProvider>(
                                builder: (context, value, _) {
                                  int id = value.cart.indexWhere(
                                      (element) => element.menuId == menu.id);
                                  return Text(
                                    (id == -1)
                                        ? "0"
                                        : value.cart[id].quantity.toString(),
                                    style: GoogleFonts.montserrat(fontSize: 16),
                                  );
                                },
                              ),
                              SizedBox(height: 4),
                              IconButton(
                                icon: Icon(Icons.remove_circle,
                                    color: Colors.red),
                                onPressed: () {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .addRemove(menu.id, menu.nama, false);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: Text("Tidak ada data"));
            }
          },
        ),
      ),
    );
  }
}

class MenuModel {
  final int id;
  final String nama;
  final String deskripsi;
  final String image;
  final int harga;

  MenuModel({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.image,
    required this.harga,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      id: json['id'] ?? 0,
      nama: json['nama'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
      image: json['image'] ?? '',
      harga: json['harga'] ?? 0,
    );
  }
}

class CartItem {
  final int menuId;
  final String name;
  int quantity;

  CartItem({required this.menuId, required this.name, this.quantity = 0});
}

class CartProvider with ChangeNotifier {
  List<CartItem> _cart = [];

  List<CartItem> get cart => _cart;

  int get totalItems => _cart.fold(0, (total, item) => total + item.quantity);

  void addRemove(int menuId, String name, bool isAdd) {
    int index = _cart.indexWhere((item) => item.menuId == menuId);

    if (index != -1) {
      if (isAdd) {
        _cart[index].quantity++;
      } else {
        _cart[index].quantity--;
        if (_cart[index].quantity <= 0) {
          _cart.removeAt(index);
        }
      }
    } else if (isAdd) {
      _cart.add(CartItem(menuId: menuId, name: name, quantity: 1));
    }

    notifyListeners();
  }
}
