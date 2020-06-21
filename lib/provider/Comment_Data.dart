import 'package:flutter/cupertino.dart';
import 'package:white/provider/comment.dart';

class CommentData with ChangeNotifier{

  List<Comment> comments = [
    Comment(text :"good doctor"),

  ];

  int  get commentCount {
    return comments.length;


  }
  void addComment(String newComment){
    comments.add(Comment(text: newComment));
    notifyListeners();

  }
  void updateComment(Comment comment){
    notifyListeners();
  }
  void deleteTask(Comment comment){
    comments.remove(comment);
    notifyListeners();
  }

}