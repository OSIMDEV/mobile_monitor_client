import 'dart:convert';

final class PostDataL {
  PostDataL({
    required this.type,
    required this.names,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['names'] = jsonEncode([...names]);
    return data;
  }

  final String type;
  final Iterable<String> names;
}
