import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/market_provider.dart';
import '../providers/game_state_provider.dart';
import '../game/economy/market_price_service.dart';

class MarketScreen extends ConsumerStatefulWidget {
  const MarketScreen({super.key});

  @override
  ConsumerState<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends ConsumerState<MarketScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(marketProvider.notifier).loadMarket();
    });
  }

  void _openTradeModal(CommodityPriceInfo commodity, bool isSelling) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF0D1520),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        side: BorderSide(color: Color(0xFF1A3050)),
      ),
      builder: (ctx) => _TradeModal(
        commodity: commodity,
        isSelling: isSelling,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final marketState = ref.watch(marketProvider);
    final gameState = ref.watch(gameStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('RHEASILVIA COMMODITY EXCHANGE'),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF0F1E30),
              border: Border.all(color: const Color(0xFFFFB740)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '⁂ ${marketState.solars.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (m) => "${m[1]},")} Solars',
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFB740),
              ),
            ),
          ),
        ],
      ),
      body: marketState.isLoading
          ? const Center(child: CircularProgressIndicator(color: Color(0xFF00D4FF)))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Hero Banner
                      _buildHeroBanner(gameState.gameTurn, marketState.tradeLevel, marketState.tradeBonusPct),
                      const SizedBox(height: 24),

                      // Trading Floor Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'COMMODITY TRADING FLOOR',
                            style: TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 12,
                              letterSpacing: 1.5,
                              color: Color(0xFF00D4FF),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '4 Vesta Docking Slip #12 // Cycle #${gameState.gameTurn}',
                            style: const TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 11,
                              color: Color(0xFF5A7A9A),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Commodity Cards Grid
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 14,
                          mainAxisSpacing: 14,
                          childAspectRatio: 2.0,
                        ),
                        itemCount: marketState.prices.length,
                        itemBuilder: (context, idx) {
                          final item = marketState.prices[idx];
                          final stock = marketState.stockpiles[item.name] ?? 0;
                          return _buildCommodityCard(item, stock);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildHeroBanner(int turn, int tradeLevel, double tradeBonusPct) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1520),
        border: Border.all(color: const Color(0xFFFFB740).withValues(alpha: 0.4)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFB740).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(Icons.storefront, color: Color(0xFFFFB740), size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'VESTA TRADING POST // RHEASILVIA FREEPORT',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Automated clearinghouse & deep-space commodity exchange on Asteroid 4 Vesta.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              if (tradeLevel > 0)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00D4FF).withValues(alpha: 0.1),
                    border: Border.all(color: const Color(0xFF00D4FF)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'TRADE RELATIONS',
                        style: TextStyle(fontSize: 10, fontFamily: 'monospace', color: Color(0xFF00D4FF)),
                      ),
                      Text(
                        '+${(tradeBonusPct * 100).round()}% Sell / -${(tradeBonusPct * 100).round()}% Buy',
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCommodityCard(CommodityPriceInfo item, int stock) {
    final isBullish = item.isBullish;
    final trendColor = isBullish ? const Color(0xFF39FF98) : const Color(0xFFFF4D6A);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1520),
        border: Border.all(color: const Color(0xFF1A3050)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Header Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.icon, style: const TextStyle(fontSize: 24)),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      item.uses,
                      style: const TextStyle(fontSize: 11, color: Color(0xFF00D4FF)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: trendColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '${item.trendText} ${isBullish ? "▲" : "▼"}',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: trendColor,
                  ),
                ),
              ),
            ],
          ),

          // Price & Stock Stats
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF060A10),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: const Color(0xFF1A3050)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatColumn('STOCK', '$stock m³', Colors.white),
                _buildStatColumn('BID (SELL)', '⁂${item.sellPrice}', const Color(0xFF39FF98)),
                _buildStatColumn('ASK (BUY)', '⁂${item.buyPrice}', const Color(0xFFFFB740)),
              ],
            ),
          ),

          // Buy & Sell Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: stock > 0 ? () => _openTradeModal(item, true) : null,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF39FF98),
                    side: const BorderSide(color: Color(0xFF39FF98)),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  child: const Text('SELL', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _openTradeModal(item, false),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB740),
                    foregroundColor: const Color(0xFF080C10),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  child: const Text('BUY', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 9, color: Color(0xFF5A7A9A), fontFamily: 'monospace'),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: color, fontFamily: 'monospace'),
        ),
      ],
    );
  }
}

class _TradeModal extends ConsumerStatefulWidget {
  final CommodityPriceInfo commodity;
  final bool isSelling;

  const _TradeModal({
    required this.commodity,
    required this.isSelling,
  });

  @override
  ConsumerState<_TradeModal> createState() => _TradeModalState();
}

class _TradeModalState extends ConsumerState<_TradeModal> {
  int _quantity = 10;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    final market = ref.read(marketProvider);
    final stock = market.stockpiles[widget.commodity.name] ?? 0;
    if (widget.isSelling) {
      _quantity = stock > 0 ? stock.clamp(1, 50) : 0;
    } else {
      final unitPrice = widget.commodity.buyPrice;
      final maxAffordable = unitPrice > 0 ? (market.solars / unitPrice).floor() : 0;
      _quantity = maxAffordable.clamp(0, 50);
    }
  }

  Future<void> _executeTrade() async {
    if (_quantity <= 0) return;
    setState(() => _isProcessing = true);

    try {
      final notifier = ref.read(marketProvider.notifier);
      final success = widget.isSelling
          ? await notifier.sellCommodity(item: widget.commodity.name, qty: _quantity)
          : await notifier.buyCommodity(item: widget.commodity.name, qty: _quantity);

      if (mounted) {
        Navigator.of(context).pop();
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                widget.isSelling
                    ? 'Sold $_quantity m³ of ${widget.commodity.name} for ⁂${_quantity * widget.commodity.sellPrice} Solars.'
                    : 'Purchased $_quantity m³ of ${widget.commodity.name} for ⁂${_quantity * widget.commodity.buyPrice} Solars.',
              ),
              backgroundColor: widget.isSelling ? const Color(0xFF39FF98) : const Color(0xFFFFB740),
            ),
          );
        }
      }
    } finally {
      if (mounted) {
        setState(() => _isProcessing = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final market = ref.watch(marketProvider);
    final stock = market.stockpiles[widget.commodity.name] ?? 0;
    final unitPrice = widget.isSelling ? widget.commodity.sellPrice : widget.commodity.buyPrice;
    final totalSolars = _quantity * unitPrice;

    final maxPossible = widget.isSelling
        ? stock
        : (unitPrice > 0 ? (market.solars / unitPrice).floor() : 0);

    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(widget.commodity.icon, style: const TextStyle(fontSize: 28)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.isSelling ? 'SELL ${widget.commodity.name.toUpperCase()}' : 'BUY ${widget.commodity.name.toUpperCase()}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: widget.isSelling ? const Color(0xFF39FF98) : const Color(0xFFFFB740),
                      ),
                    ),
                    Text(
                      'Unit Price: ⁂$unitPrice / m³ // Stockpile: $stock m³',
                      style: const TextStyle(fontSize: 12, color: Color(0xFF5A7A9A)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Quantity Slider & Input
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('VOLUME (m³)', style: TextStyle(fontFamily: 'monospace', fontSize: 12, color: Color(0xFF00D4FF))),
              Text(
                '$_quantity m³',
                style: const TextStyle(fontFamily: 'monospace', fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
          if (maxPossible > 0) ...[
            Slider(
              value: _quantity.toDouble().clamp(1.0, maxPossible.toDouble()),
              min: 1.0,
              max: maxPossible.toDouble(),
              divisions: maxPossible > 1 ? maxPossible : 1,
              activeColor: widget.isSelling ? const Color(0xFF39FF98) : const Color(0xFFFFB740),
              onChanged: (val) => setState(() => _quantity = val.round()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildQuickButton('10 m³', 10, maxPossible),
                _buildQuickButton('50 m³', 50, maxPossible),
                _buildQuickButton('100 m³', 100, maxPossible),
                _buildQuickButton('MAX ($maxPossible)', maxPossible, maxPossible),
              ],
            ),
          ] else ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                widget.isSelling ? 'No stockpile available to sell.' : 'Insufficient Solars to purchase any units.',
                style: const TextStyle(color: Color(0xFFFF4D6A), fontSize: 13),
              ),
            ),
          ],
          const SizedBox(height: 20),

          // Total Proceeds / Cost
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFF060A10),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF1A3050)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.isSelling ? 'TOTAL PROCEEDS' : 'TOTAL COST',
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 12, color: Color(0xFF5A7A9A)),
                ),
                Text(
                  '⁂${totalSolars.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (m) => "${m[1]},")}',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: widget.isSelling ? const Color(0xFF39FF98) : const Color(0xFFFFB740),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Confirm Action Button
          SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: (_quantity > 0 && !_isProcessing && maxPossible > 0) ? _executeTrade : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.isSelling ? const Color(0xFF39FF98) : const Color(0xFFFFB740),
                foregroundColor: const Color(0xFF080C10),
              ),
              child: _isProcessing
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF080C10)),
                    )
                  : Text(
                      widget.isSelling ? 'CONFIRM SALE' : 'CONFIRM PURCHASE',
                      style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickButton(String label, int amount, int maxPossible) {
    return OutlinedButton(
      onPressed: maxPossible >= amount ? () => setState(() => _quantity = amount.clamp(1, maxPossible)) : null,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        side: const BorderSide(color: Color(0xFF1A3050)),
      ),
      child: Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF00D4FF))),
    );
  }
}
