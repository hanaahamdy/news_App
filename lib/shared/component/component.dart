import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/bloc/states_screen.dart';
import '../../screens/screens/web_view_screen.dart';
import '../constant/styles.dart';

import '../constant/constant.dart';

InkWell newsItem(double height, double width, list,context) {
  return InkWell(splashColor: Colors.deepOrange,
    onTap: (){
    Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context)=>Web_View_Screen(url: list['url'],)), (route) => false);},
    child: Row(
      children: [
        list['urlToImage'] == null
            ? Container(
                height: height * .2,
                width: width * .4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/loading.gif"), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(15),
                ))
            : Container(clipBehavior: Clip.antiAliasWithSaveLayer,
                child: list['urlToImage'].isNotEmpty
                    ? FadeInImage.assetNetwork(
                        placeholder: "images/loading.gif",
                        image: list['urlToImage'],fit: BoxFit.cover,)
                    : null,
                height: height * .2,
                width: width * .4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                )),
        SizedBox(
          width: width * .06,
        ),
        Expanded(
          child: Container(
            height: height * .2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "${list['title']}",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Text("${list['publishedAt']}", style: style2),
              ],
            ),
          ),
        )
      ],
    ),
  );

}

BuildCondition buildPageContent(List<dynamic> list) {
  return BuildCondition(
    condition: list.length>0,
    builder: (context) => ListView.separated(shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: newsItem(height, width, list[index],context),
        ),
        separatorBuilder: (context, index) {
          return SizedBox(
            child: Divider(),
          );
        },
        itemCount: list.length),
    fallback: (context) => Center(
      child: CircularProgressIndicator(),
    ),
  );
}
