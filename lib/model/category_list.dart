class Categories {
  final List<String> _immigration = [
    'passport',
    'passport copy',
    'e-ticket',
    'hotel voucher',
    'credit/debit card',
    'driver\'s license'
  ];

  final List<String> _electronics = [
    'charger',
    'airpod',
    'speaker',
    'dryer',
    'Camera',
  ];

  final List<String> _makeups = [
    'sunscreen',
    'perfume',
    'body wash',
    'form cleanser'
  ];

  final List<String> _clothes = [
    'outer',
    'underwear',
    'socks',
    'bags',
    'hat',
  ];

  List<String> get immigration => _immigration;

  List<String> get electronics => _electronics;

  List<String> get clothes => _clothes;

  List<String> get makeups => _makeups;
}