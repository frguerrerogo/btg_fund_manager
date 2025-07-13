import 'package:btg_fund_manager/presentation/core/widgets.dart' show AppScaffold;
import 'package:flutter/material.dart';

class FundDetailPage extends StatelessWidget {
  final String fundId;

  const FundDetailPage({super.key, required this.fundId});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return AppScaffold(
      title: 'Fund Details',
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(12),
            //   child: Image.network(
            //     'https://images.unsplash.com/photo-1581091215367-59d2957c1d2b', // reemplaza con tu imagen o placeholder
            //     height: 180,
            //     width: double.infinity,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            const SizedBox(height: 16),
            // Text(fundName, style: Theme.of(context).textTheme.titleLarge),
            // Text('Managed by $manager', style: TextStyle(color: Colors.grey.shade600)),
            // Text('Risk Level: $riskLevel', style: TextStyle(color: Colors.grey.shade600)),
            // const SizedBox(height: 24),
            // Text('Fund Overview', style: Theme.of(context).textTheme.titleMedium),
            // const SizedBox(height: 8),
            // Text(overview, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 24),
            Text('Subscription', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter amount',
                filled: true,
                fillColor: Color(0xFFF3F4F6),
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 8),
            // Text(
            //   'Minimum subscription: \$${minimum.toStringAsFixed(0)}',
            //   style: TextStyle(color: Colors.grey.shade600),
            // ),
            // Text(
            //   'Available balance: \$${balance.toStringAsFixed(0)}',
            //   style: TextStyle(color: Colors.grey.shade600),
            // ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Subscribe'),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFE5E7EB)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Cancel Participation'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
