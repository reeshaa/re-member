import 'package:flutter/material.dart';
import 'package:re_member/src/widgets/floating_tab_bar.dart';

class Discussion extends StatefulWidget {
  const Discussion({Key? key}) : super(key: key);

  @override
  _DiscussionState createState() => _DiscussionState();
}

class _DiscussionState extends State<Discussion>
    with SingleTickerProviderStateMixin {
  bool isChecked = false;
  late final blah;
  @override
  @override
  Widget build(BuildContext context) {
    return Column(children: [
    Card(
        color: Colors.white,
        child: ListTile(
          onTap: () {},
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          title: Text(
            "Why is earth so flat?",
            style: TextStyle(color: Colors.black),
          ),
          subtitle:Text("lizz man",style: TextStyle(color: Colors.black),),
          leading: CircleAvatar(backgroundImage: NetworkImage("https://images.unsplash.com/photo-1593085512500-5d55148d6f0d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1780&q=80"),),
          trailing:  IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.thumbs_up_down,
                color: Colors.black,
              )),
        ),
      ),
      
      Card(
        color: Colors.white,
        child: ListTile(
          onTap: () {},
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          title: Text(
            "Why is earth so flat?",
            style: TextStyle(color: Colors.black),
          ),
          subtitle:Text("mayo man",style: TextStyle(color: Colors.black),),
          leading: CircleAvatar(backgroundImage: NetworkImage("https://images.unsplash.com/photo-1593085512500-5d55148d6f0d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1780&q=80"),),
          trailing:  IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.thumbs_up_down,
                color: Colors.black,
              )),
        ),
      ),
       Card(
        color: Colors.white,
        child: ListTile(
          onTap: () {},
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          title: Text(
            "Why is earth so flat?",
            style: TextStyle(color: Colors.black),
          ),
          subtitle:Text("mayo man",style: TextStyle(color: Colors.black),),
        leading: CircleAvatar(backgroundImage: NetworkImage("https://images.unsplash.com/photo-1593085512500-5d55148d6f0d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1780&q=80"),),
          trailing:  IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.thumbs_up_down,
                color: Colors.black,
              )),
        ),
      ),
       Card(
        color: Colors.white,
        child: ListTile(
          onTap: () {},
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          title: Text(
            "Why is earth so flat?",
            style: TextStyle(color: Colors.black),
          ),
          subtitle:Text("mayo man",style: TextStyle(color: Colors.black),),
         leading: CircleAvatar(backgroundImage: NetworkImage("https://images.unsplash.com/photo-1593085512500-5d55148d6f0d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1780&q=80"),),
          trailing:  IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.thumbs_up_down,
                color: Colors.black,
              )),
        ),
      ),
      Card(
        color: Colors.white,
        child: ListTile(
          onTap: () {},
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          title: Text(
            "Why is the grass green?",
            style: TextStyle(color: Colors.black),
          ),
          subtitle: Text("liok",style: TextStyle(color: Colors.black),),
         leading: CircleAvatar(backgroundImage: NetworkImage("https://images.unsplash.com/photo-1593085512500-5d55148d6f0d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1780&q=80"),),
          trailing:  IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.thumbs_up_down,
                color: Colors.black,
              )),
        ),
      ),
    IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_outline,size: 45,))
    ]);
  }
}
