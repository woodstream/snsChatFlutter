import 'package:flutter/material.dart';
import 'package:snschat_flutter/general/ui-component/custom_dialogs.dart';
import 'package:snschat_flutter/objects/chat/conversation_group.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChatInfoPage extends StatefulWidget {
  Conversation _conversation;

  ChatInfoPage([this._conversation]); //do not final

  @override
  State<StatefulWidget> createState() {
    return new ChatInfoPageState();
  }
}

class ChatInfoPageState extends State<ChatInfoPage> {
  TextEditingController textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = new TextEditingController();
    textEditingController.text = widget._conversation.name;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Material(
          color: Colors.white,
          child: CustomScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                floating: true,
                pinned: true,
                titleSpacing: 0.0,

                expandedHeight: 250.0,
                flexibleSpace: FlexibleSpaceBar(
                    title: Hero(
                      tag: widget._conversation.name,
                      child: FlatButton(
                          onPressed: () async {
                            CustomDialogs customDialog = new CustomDialogs(
                                context: context,
                                title: "Edit Group Name",
                                description:
                                    "Edit the group name below. Press OK to save.",
                                value: widget._conversation.name);
                            String groupName =
                                await customDialog.showConfirmationDialog();
                            print("groupName: " + groupName);
                            if (widget._conversation.name != groupName) {
                              widget._conversation.name = groupName;
                            }
                            print("widget._conversation.name: " +
                                widget._conversation.name);
                          },
                          child: Text(
                            widget._conversation.name,
                            style:
                                TextStyle(color: Colors.white),
                          )),
                    ),
                    background: Hero(
                      tag: widget._conversation.id,
                      child: Image.asset(
                        "lib/ui/images/group2013.jpg",
                        fit: BoxFit.cover,
                      ),
                    )),
                actions: <Widget>[
                  IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: "Shared!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIos: 1,
                            fontSize: 16.0
                        );
                      })
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Material(
                      color: Colors.white,
                      child: Container(
                        height: 60.0,
                        child: InkWell(
                          onTap: () {
                            print("Tapped.");
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                ),
                                Text(
                                  "Group description",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                ),
                                Text(
                                  widget._conversation.description == ""
                                      ? "Add Group description"
                                      : widget._conversation.description,
                                  style: TextStyle(
                                      fontSize: 17.0, color: Colors.black54),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 5.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                  Material(
                      color: Colors.white,
                      child: Container(
                        height: 60.0,
                        child: InkWell(
                          onTap: () {
                            print("Tapped.");
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                ),
                                Text(
                                  "Notifications",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                ),
                                Text(
                                  widget._conversation.notificationExpireDate ==
                                          0
                                      ? "On"
                                      : "Off",
                                  style: TextStyle(
                                      fontSize: 17.0, color: Colors.black54),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 5.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                  Material(
                      color: Colors.white,
                      child: Container(
                        height: 60.0,
                        child: InkWell(
                          onTap: () {
                            print("Tapped.");
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, top: 10.0, right: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "Favourites⭐",
                                          style: TextStyle(fontSize: 17.0),
                                        ),
                                        Icon(Icons.keyboard_arrow_right)
                                      ],
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 5.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                  Material(
                      color: Colors.white,
                      child: Container(
                        height: 60.0,
                        child: InkWell(
                          onTap: () {
                            print("Tapped.");
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, top: 10.0, right: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "Media",
                                          style: TextStyle(fontSize: 17.0),
                                        ),
                                        Icon(Icons.keyboard_arrow_right)
                                      ],
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 5.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                  Material(
                      color: Colors.white,
                      child: Container(
                        height: 60.0,
                        child: InkWell(
                          onTap: () {
                            print("Tapped.");
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, top: 10.0, right: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(Icons.people),
                                        Text(
                                          "Group members",
                                          style: TextStyle(fontSize: 17.0),
                                        ),
                                      ],
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 5.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                  Material(
                      color: Colors.white,
                      child: Container(
                        height: 60.0,
                        child: InkWell(
                          onTap: () {
                            print("Tapped.");
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, top: 10.0, right: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(Icons.exit_to_app,
                                            color: Colors.red),
                                        Text(
                                          "Exit group",
                                          style: TextStyle(
                                              fontSize: 17.0,
                                              color: Colors.red),
                                        ),
                                      ],
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 5.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                  Material(
                      color: Colors.white,
                      child: Container(
                        height: 60.0,
                        child: InkWell(
                          onTap: () {
                            print("Tapped.");
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, top: 10.0, right: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(Icons.report, color: Colors.red),
                                        Text(
                                          "Report group",
                                          style: TextStyle(
                                              fontSize: 17.0,
                                              color: Colors.red),
                                        ),
                                      ],
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 5.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                ]),
              ),
            ],
          )),
    );
  }
}
