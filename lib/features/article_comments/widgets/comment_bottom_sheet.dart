import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaunfunk/features/article/models/user_article.dart';
import 'package:zaunfunk/features/authentication/logic/user_provider.dart';
import '../../../shared/config/colors.dart';
import '../../../shared/widgets/buttons/zf_elevated_button.dart';
import '../../article/repositories/article_repository.dart';

class CommentBottomSheet extends StatefulWidget {
  const CommentBottomSheet({
    super.key,
    required this.article,
  });

  final UserArticle article;

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      width: double.infinity,
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: SingleChildScrollView(
                  reverse: true,
                  child: Text(
                      style: const TextStyle(fontSize: 20),
                      _commentController.text),
                )),
            TextField(
              cursorColor: gardenGreen,
              decoration: const InputDecoration(
                hintText: 'Mache ein Kommentar...',
                hintStyle: TextStyle(color: gardenGreen),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                fillColor: Colors.white,
                filled: true,
              ),
              onChanged: (value) {
                setState(() {
                  _commentController.text;
                });
              },
              controller: _commentController,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Consumer<UserProvider>(builder: (context, provider, child) => ZfElevatedButton(
                    onPressed: () {
                      context.read<ArticleRepository>().addComment(
                          widget.article.articleId,
                          provider.currentUser!.userName,
                          provider.currentUser!.clubId,
                          provider.currentUser!.userImagePath,
                          _commentController.text);
                
                      Navigator.pop(context);
                    },
                    text: 'Posten'),
              ),
            )
          ],
        ),
      )),
    );
  }
}
