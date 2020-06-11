import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shopApp/providers/product.dart';
import 'package:shopApp/providers/product_provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final imageController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var editedProduct = Product(
    id: null,
    title: '',
    price: 0,
    description: '',
    imageUrl: '',
  );

  void _saveForm() {
    _form.currentState.save();
    Provider.of<Products>(context, listen: false).addProduct(editedProduct);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    imageController.dispose();
    _priceFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: 'Title'),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (value) {
                  editedProduct = Product(
                    id: null,
                    title: value,
                    description: editedProduct.description,
                    imageUrl: editedProduct.imageUrl,
                    price: editedProduct.price,
                  );
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: 'Price'),
                focusNode: _priceFocusNode,
                onSaved: (value) {
                  editedProduct = Product(
                    id: null,
                    title: editedProduct.title,
                    description: editedProduct.description,
                    imageUrl: editedProduct.imageUrl,
                    price: double.parse(value),
                  );
                },
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                decoration: InputDecoration(labelText: 'Description'),
                onSaved: (value) {
                  editedProduct = Product(
                    id: null,
                    title: editedProduct.title,
                    description: value,
                    imageUrl: editedProduct.imageUrl,
                    price: editedProduct.price,
                  );
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black87)),
                    margin: EdgeInsets.only(
                      top: 8,
                      right: 10,
                    ),
                    height: 100,
                    width: 100,
                    child: imageController.text.isEmpty
                        ? Text('Enter a URL')
                        : FittedBox(
                            child: Image.network(imageController.text,
                                fit: BoxFit.cover),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.url,
                      decoration: InputDecoration(labelText: 'Image Url'),
                      textInputAction: TextInputAction.done,
                      controller: imageController,
                      onSaved: (value) {
                        editedProduct = Product(
                          id: null,
                          title: editedProduct.title,
                          description: editedProduct.description,
                          imageUrl: value,
                          price: editedProduct.price,
                        );
                      },
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
