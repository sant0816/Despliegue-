import 'package:flutter/material.dart';

class MetodoPagoScreen extends StatelessWidget {
  const MetodoPagoScreen({super.key});

  void _mostrarConfirmacion(BuildContext context, String metodo) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Confirmación"),
        content: Text("Has seleccionado: $metodo"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Aceptar"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medio de Pago'),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.blue.shade50,
            child: ListTile(
              leading: Icon(Icons.credit_card, color: Colors.redAccent),
              title: Text('Tarjeta de Crédito o Débito'),
              onTap: () => _mostrarConfirmacion(context, 'Tarjeta de Crédito o Débito'),
            ),
          ),
          Divider(),
          
          ListTile(
            leading: Icon(Icons.account_balance_wallet, color: Colors.redAccent),
            title: Text('PayPal'),
            onTap: () => _mostrarConfirmacion(context, 'PayPal'),
          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.account_balance, color: Colors.redAccent),
            title: Text('Transferencia Bancaria'),
            onTap: () => _mostrarConfirmacion(context, 'Transferencia Bancaria'),
          ),
        ],
      ),
    );
  }
}
