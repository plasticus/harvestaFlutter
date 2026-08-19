import 'dart:math';

class CommodityPriceInfo {
  final String name;
  final String icon;
  final int basePrice;
  final int currentBase;
  final int buyPrice;
  final int sellPrice;
  final double variancePct;
  final String desc;
  final String uses;

  const CommodityPriceInfo({
    required this.name,
    required this.icon,
    required this.basePrice,
    required this.currentBase,
    required this.buyPrice,
    required this.sellPrice,
    required this.variancePct,
    required this.desc,
    required this.uses,
  });

  bool get isBullish => variancePct >= 0;
  String get trendText => '${variancePct >= 0 ? '+' : ''}${(variancePct * 100).round()}%';
}

class MarketPriceService {
  static const Map<String, ({String icon, int basePrice, String desc, String uses})> commoditiesConfig = {
    'Conductive Metals': (
      icon: '⚡',
      basePrice: 1100,
      desc: 'High-purity copper, silver, and superconductor alloys. Essential for in-house drydock repairs, avionics, and radar upgrades.',
      uses: 'Drydock Repairs, Scanner Arrays',
    ),
    'Zero-G Construction Metals': (
      icon: '🏗️',
      basePrice: 750,
      desc: 'Ultra-lightweight titanium and carbon-nanotube lattices cast in microgravity. Core material for structural hull repair.',
      uses: 'Drydock Repairs, Hangar Expansion',
    ),
    'Surface Construction Metals': (
      icon: '🔩',
      basePrice: 350,
      desc: 'Dense nickel-iron structural beams and heavy ballast plates. Primary building blocks for planetary and orbital station modules.',
      uses: 'Station Infrastructure, Industrial Drydock',
    ),
    'Life Support Gases': (
      icon: '🫧',
      basePrice: 650,
      desc: 'Compressed oxygen-nitrogen atmospheric blends and trace scrubbers required for crew habitats and vessel emergency pods.',
      uses: 'Drydock Repairs, Station Habitats',
    ),
    'Fuel Gases': (
      icon: '⛽',
      basePrice: 500,
      desc: 'Enriched hydrogen and deuterium propellant gas for fusion thrusters and long-range expedition transit burns.',
      uses: 'Expedition Transit Fuel, Sublight Engines',
    ),
    'Other Valuable Elements': (
      icon: '💎',
      basePrice: 2400,
      desc: 'Rare-earth isotopes, platinum group catalysts, and actinide minerals with premium market liquidity.',
      uses: 'High-Tech Weapons, Advanced R&D, Liquidity',
    ),
    'Water Ice': (
      icon: '🧊',
      basePrice: 400,
      desc: 'Cometary volatile ice. Processed into potable station water, radiation shielding blankets, and reaction mass.',
      uses: 'Station Life Support, Agriculture',
    ),
  };

  /// Calculates prices for all 7 commodities deterministically given turn number and Trade Relationships research tier.
  static List<CommodityPriceInfo> getAllPrices({
    required int turn,
    int tradeRelationshipsLevel = 0,
  }) {
    return commoditiesConfig.entries.map((entry) {
      return getPrice(
        commodity: entry.key,
        turn: turn,
        tradeRelationshipsLevel: tradeRelationshipsLevel,
      );
    }).toList();
  }

  /// Calculates individual commodity pricing
  static CommodityPriceInfo getPrice({
    required String commodity,
    required int turn,
    int tradeRelationshipsLevel = 0,
  }) {
    final config = commoditiesConfig[commodity] ?? (
      icon: '📦',
      basePrice: 500,
      desc: 'Standard industrial commodity.',
      uses: 'Industrial Operations',
    );

    // 1. Consistent deterministic hash for price variance
    final seed = _hashString(commodity) + turn;
    final variancePct = (((seed.abs() % 21) - 10) / 100.0); // -10% to +10%

    // 2. Base price with variance
    final currentBase = max(50, (config.basePrice * (1.0 + variancePct)).round());

    // 3. Trade bonus (3% per level, up to 20% cap)
    final tradeBonusPct = min(0.20, tradeRelationshipsLevel * 0.03);

    // 4. Buy (Ask) and Sell (Bid) prices
    final sellPrice = max(10, ((currentBase * 0.90) * (1.0 + tradeBonusPct)).round());
    final buyPrice = max(20, ((currentBase * 1.20) * (1.0 - tradeBonusPct)).round());

    return CommodityPriceInfo(
      name: commodity,
      icon: config.icon,
      basePrice: config.basePrice,
      currentBase: currentBase,
      buyPrice: buyPrice,
      sellPrice: sellPrice,
      variancePct: variancePct,
      desc: config.desc,
      uses: config.uses,
    );
  }

  /// Fast, deterministic 32-bit polynomial string hash
  static int _hashString(String s) {
    var hash = 0;
    for (var i = 0; i < s.length; i++) {
      hash = (31 * hash + s.codeUnitAt(i)) & 0x7FFFFFFF;
    }
    return hash;
  }
}
