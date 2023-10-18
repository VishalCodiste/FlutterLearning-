import 'package:flutter/material.dart';
import 'package:flutterlearning/models/cartmodel.dart';
import 'package:flutterlearning/models/catelogModel.dart';

class CartPage extends StatefulWidget {
  final Cartmodel objCart;

  CartPage(this.objCart);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isCartChanged = false; // Track if the cart has changed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: CartList(
                  objCart: widget.objCart,
                  onCartChanged: () {
                    setState(() {
                      isCartChanged = true;
                    });
                  }),
            ),
            const Divider(),
            CartTotal(
              objCart: widget.objCart,
            ),
          ],
        ),
      ),
    );
  }
}

class CartList extends StatefulWidget {
  final Cartmodel objCart;
  final VoidCallback? onCartChanged; // Callback function

  CartList({Key? key, required this.objCart, this.onCartChanged})
      : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    if (widget.objCart.items.isEmpty) {
      return const Expanded(
        child: Center(
          child: Text("No items to show."),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: widget.objCart.items.length,
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.done),
          trailing: IconButton(
            onPressed: () {
              widget.objCart.remove(widget.objCart.items[index]);
              setState(() {
                widget.onCartChanged?.call(); // Call the callback function
              });
            },
            icon: Icon(Icons.remove_circle_outline),
          ),
          title: Text(widget.objCart.items[index].name),
        ),
      );
    }
  }
}

class CartTotal extends StatefulWidget {
  final Cartmodel objCart;

  CartTotal({Key? key, required this.objCart}) : super(key: key);

  @override
  State<CartTotal> createState() => _CartTotalState();
}

class _CartTotalState extends State<CartTotal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "\$${widget.objCart.totalPrice.toString()}",
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(30), // Set the corner radius
            child: Container(
              height: 45,
              width: 120,
              decoration: const BoxDecoration(
                color: Colors.blue, // Set your desired background color
              ),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Buying not supported yet.")));
                }, // Make the button disabled
                child: const Text(
                  "Buy Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16, // Adjust the font size as needed
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class _CartTotal extends StatelessWidget {
//   final Cartmodel objCart;

//   _CartTotal(this.objCart);

//   @override
//   Widget build(BuildContext context) {
    
//   }
// }
