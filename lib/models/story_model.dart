
import 'package:flutter_facebook_clone/models/user_model.dart';

class Story{
  final User user;
  final String imageUrl;
  final bool isViewed;

  const Story({
    required this.imageUrl, required this.user,  this.isViewed = false
  });
}