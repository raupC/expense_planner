class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });

  String getString(){
    return 'Id: $id Title:$title | Amount: $amount | Date: $date';
  }
}
