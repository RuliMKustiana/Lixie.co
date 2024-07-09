import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:universal_html/html.dart' as html;

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  String _productName = '';
  int _productStock = 0;
  double _productPrice = 0.0;
  String _productSize = '';
  String _productColor = '';
  XFile? _productImage;
  String? _imageUrl;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _productImage = pickedFile;
      });

      if (kIsWeb) {
        final bytes = await pickedFile.readAsBytes();
        final blob = html.Blob([bytes]);
        setState(() {
          _imageUrl = html.Url.createObjectUrlFromBlob(blob);
        });
      }
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Logika untuk menyimpan produk baru
      print('Product Name: $_productName');
      print('Product Stock: $_productStock');
      print('Product Price: $_productPrice');
      print('Product Size: $_productSize');
      print('Product Color: $_productColor');
      print('Product Image: ${_productImage?.path}');
      // Setelah menyimpan data kembali ke halaman sebelumnya atau berikan feedback ke user
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Produk'),
        backgroundColor: Color(0xFF8B0000), // Merah Gelap
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nama Produk',
                    labelStyle: TextStyle(color: Color(0xFF8B0000)), // Merah Gelap
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Masukkan nama produk';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _productName = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Stok Produk',
                    labelStyle: TextStyle(color:Color(0xFF8B0000)), // Merah
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Masukkan stok produk';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _productStock = int.parse(value!);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Harga Produk',
                    labelStyle: TextStyle(color: Color(0xFF8B0000)), // Merah
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Masukkan harga produk';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _productPrice = double.parse(value!);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Ukuran Produk',
                    labelStyle: TextStyle(color: Color(0xFF8B0000)), // Merah Gelap
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Masukkan ukuran produk';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _productSize = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Warna Produk',
                    labelStyle: TextStyle(color: Color(0xFF8B0000)), // Merah Gelap
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Masukkan warna produk';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _productColor = value!;
                  },
                ),
                SizedBox(height: 20),
                _productImage == null
                    ? Text('Tidak ada gambar yang dipilih.', style: TextStyle(color: Color(0xFF000000))) // Hitam
                    : kIsWeb
                        ? Image.network(_imageUrl!)
                        : Image.file(File(_productImage!.path)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Pilih Gambar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF8B0000), // Merah Gelap
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Tambah Produk'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF000000), // Hitam
                    foregroundColor: Colors.white,
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

void main() {
  runApp(MaterialApp(
    home: AddProductPage(),
  ));
}

