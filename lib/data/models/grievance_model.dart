class Grievance {
  final int? id;
  final String title;
  final String description;
  final String status;
  final String createdDate;
  final String updatedDate;
  final List<int>? image;
  final List<int>? pdf;

  Grievance({
    this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.createdDate,
    required this.updatedDate,
    this.image,
    this.pdf,
  });

  // Convert a Grievance object into a map for database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
      'createdDate': createdDate,
      'updatedDate': updatedDate,
      'image': image,
      'pdf': pdf,
    };
  }

  // Convert a map into a Grievance object
  factory Grievance.fromMap(Map<String, dynamic> map) {
    return Grievance(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      status: map['status'],
      createdDate: map['createdDate'],
      updatedDate: map['updatedDate'],
      image: map['image'] != null ? List<int>.from(map['image']) : null,
      pdf: map['pdf'] != null ? List<int>.from(map['pdf']) : null,
    );
  }
}
