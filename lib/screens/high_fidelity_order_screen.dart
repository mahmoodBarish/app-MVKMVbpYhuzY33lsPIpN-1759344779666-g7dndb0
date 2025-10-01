import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HighFidelityOrderScreen extends StatefulWidget {
  const HighFidelityOrderScreen({super.key});

  @override
  State<HighFidelityOrderScreen> createState() =>
      _HighFidelityOrderScreenState();
}

class _HighFidelityOrderScreenState extends State<HighFidelityOrderScreen> {
  int _selectedType = 0; // 0 for Deliver, 1 for Pick Up
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              _buildOrderTypeToggle(),
              const SizedBox(height: 24),
              _buildDeliveryAddress(),
              const SizedBox(height: 16),
              const Divider(color: Color(0xFFE2E2E2), thickness: 1),
              const SizedBox(height: 16),
              _buildOrderItem(),
              const SizedBox(height: 20),
              Container(height: 4, color: const Color(0xFFF9F2ED)),
              const SizedBox(height: 16),
              _buildDiscountSection(),
              const SizedBox(height: 24),
              _buildPaymentSummary(),
              const SizedBox(height: 180), // Space for the bottom bar
            ],
          ),
        ),
      ),
      bottomSheet: _buildBottomBar(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFAFAFA),
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(left: 14.0),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF262626)),
          onPressed: () => context.pop(),
        ),
      ),
      title: Text(
        'Order',
        style: GoogleFonts.sora(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF262626),
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildOrderTypeToggle() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEDEDED),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedType = 0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                decoration: BoxDecoration(
                  color: _selectedType == 0
                      ? const Color(0xFFC67C4E)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Deliver',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sora(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: _selectedType == 0
                        ? Colors.white
                        : const Color(0xFF262626),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedType = 1),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                decoration: BoxDecoration(
                  color: _selectedType == 1
                      ? const Color(0xFFC67C4E)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Pick Up',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sora(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: _selectedType == 1
                        ? Colors.white
                        : const Color(0xFF262626),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Delivery Address',
          style: GoogleFonts.sora(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF262626),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Jl. Kpg Sutoyo',
          style: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF303030),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
          style: GoogleFonts.sora(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFA2A2A2),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildActionButton(Icons.edit_outlined, 'Edit Address'),
            const SizedBox(width: 8),
            _buildActionButton(Icons.note_alt_outlined, 'Add Note'),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 16, color: const Color(0xFF303030)),
      label: Text(
        label,
        style: GoogleFonts.sora(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF303030),
        ),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        side: const BorderSide(color: Color(0xFFA2A2A2)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  Widget _buildOrderItem() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/I213_225_417_715.png',
            width: 54,
            height: 54,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Caffe Mocha',
              style: GoogleFonts.sora(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF262626),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Deep Foam',
              style: GoogleFonts.sora(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFA2A2A2),
              ),
            ),
          ],
        ),
        const Spacer(),
        _buildQuantityControl(),
      ],
    );
  }

  Widget _buildQuantityControl() {
    return Row(
      children: [
        _quantityButton(icon: Icons.remove, onPressed: _decrementQuantity),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            '$_quantity',
            style: GoogleFonts.sora(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2A2A2A),
            ),
          ),
        ),
        _quantityButton(icon: Icons.add, onPressed: _incrementQuantity),
      ],
    );
  }

  Widget _quantityButton({required IconData icon, required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFF9F2ED)),
        ),
        child: Icon(
          icon,
          size: 16,
          color: icon == Icons.remove ? const Color(0xFFA2A2A2) : const Color(0xFF2A2A2A),
        ),
      ),
    );
  }

  Widget _buildDiscountSection() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFEDEDED)),
        ),
        child: Row(
          children: [
            const Icon(Icons.local_offer_outlined, color: Color(0xFFC67C4E)),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                '1 Discount is Applies',
                style: GoogleFonts.sora(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF303030),
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF2A2A2A)),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Summary',
          style: GoogleFonts.sora(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF262626),
          ),
        ),
        const SizedBox(height: 16),
        _buildSummaryRow('Price', '\$ 4.53'),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery Fee',
              style: GoogleFonts.sora(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF303030),
              ),
            ),
            Row(
              children: [
                Text(
                  '\$ 2.0',
                  style: GoogleFonts.sora(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF2A2A2A),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '\$ 1.0',
                  style: GoogleFonts.sora(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF262626),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF303030),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF262626),
          ),
        ),
      ],
    );
  }
  
  Widget _buildBottomBar() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.account_balance_wallet_outlined, color: Color(0xFFC67C4E)),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cash/Wallet',
                    style: GoogleFonts.sora(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF262626),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$ 5.53',
                    style: GoogleFonts.sora(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFC67C4E),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_down, color: Color(0xFF2A2A2A)),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.push('/order_success');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC67C4E),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'Order',
                style: GoogleFonts.sora(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}