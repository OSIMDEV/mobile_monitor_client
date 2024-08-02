final class PostData {
  PostData({
    required this.type,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['name'] = name;
    return data;
  }

  final String type;
  final String name;
}
