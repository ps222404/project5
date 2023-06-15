class Oefening {
  final String name;
  final String description;
  final String explanation;
  final String gif;

  Oefening({
    required this.name,
    required this.description,
    required this.explanation,
    required this.gif,
  });

  factory Oefening.fromJson(Map<String, dynamic> json) {
    return Oefening(
      name: json['name'],
      description: json['description'],
      explanation: json['explanation'],
      gif: json['GIF'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'explanation': explanation,
      'GIF': gif,
    };
  }
}