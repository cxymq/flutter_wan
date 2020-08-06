import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan/models/BannerModel.dart';
import 'package:transparent_image/transparent_image.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(BannerState state, Dispatch dispatch, ViewService viewService) {
  Timer timer;

  int selectIndex = 0;

  PageController pageController;

  // bannerVM.requestResult(GlobalConfig.BANNER_URL, (isSuccess){
  //   if(isSuccess == true) {
  //     dispatch(BannerActionCreator.hadLoaded());
  //   }
  // },(error) {

  // });
  return Container(
    margin: const EdgeInsets.all(8.0),
    height: 260.0,
    color: Colors.black12,
    child: Stack(
        children: <Widget>[
            PageView.builder(   
              itemCount: state.bannerResult.length,
              controller: pageController, 
              itemBuilder: (BuildContext context, int index) {
                BannerModel bannerModel = state.bannerResult[index];
                return InkWell(
                  onTap:()=>dispatch(BannerActionCreator.onClickImg(bannerModel.url, bannerModel.title)),
                  child: FadeInImage.memoryNetwork(
                    image: bannerModel.imagePath, 
                    placeholder: kTransparentImage,
                  ),
                  
                );
              },
            
          ),
           
           Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 32.0,
                  padding: EdgeInsets.all(6.0),
                  color: Colors.black45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        Text('轮播图',
                             style: new TextStyle(color: Colors.white)),
                        // Row(children: circle())
            ],
          ),
        )),
        ],
    ));

}