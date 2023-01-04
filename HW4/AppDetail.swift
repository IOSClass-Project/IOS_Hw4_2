//
//  AppDetail.swift
//  HW4
//
//  Created by blaire on 2019/12/2.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import SwiftUI

struct AppDetail: View {
    var body: some View {
        GeometryReader{ geometry in
            ZStack
            {
                Image("mhwi")
                .resizable()
                .scaledToFill()
                .opacity(0.5)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .edgesIgnoringSafeArea(.all)
                
                ScrollView{
                    appName()
                    appImage()
                    goal()
                    usage()
                }
            }
        }
    }
}

struct appName: View
{
    var body: some View
    {
        Text("MHW入門篇")
        .font(Font.system(size:40))
        .fontWeight(.bold)
        .foregroundColor(.black)
        .frame(width:320, height:60)
            .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.white).opacity(0.1))
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
}

struct appImage: View
{
    var body: some View
    {
        Image("滅盡龍")
        .resizable()
        .scaledToFill()
        .frame(width:200, height:200)
    }
}

struct goal: View
{
    var body: some View
    {
        VStack
        {
            Text("獵人的心得📖")
                .font(Font.system(size:30))
                .fontWeight(.bold)
                .foregroundColor(Color(red: 129/255, green: 0, blue: 0))
                .multilineTextAlignment(.center)
            Text("這裡將介紹獨當一面的獵人心得。妥善利用裝備、功能、環境吧！")
                .lineLimit(Int.max)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 15))
        }
        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.white).opacity(0.9))
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.red))
        .padding(10)
    }
}

struct usage: View
{
    var body: some View
    {
        VStack
        {
            Text("MHW的玩法")
            .font(Font.system(size:30))
            .fontWeight(.bold)
            .foregroundColor(Color(red: 129/255, green: 0, blue: 0))
            .multilineTextAlignment(.center)
            
        Text("來確認關於任務和探索的流程吧。您可以透過任務進行狩獵、出門探索並對原野進行調查。另外，於任務中以狩獵與探索所獲得的素材，可用來強化裝備。")
            .lineLimit(Int.max)
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 15))
            
            Group{
                Text("承接任務")
                    .font(Font.system(size:30))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 129/255, green: 0, blue: 0))
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 20, leading: 5, bottom: 0, trailing: 15))
                
                Image("接任務")
                    .resizable()
                    .scaledToFill()
                Text("從據點的接待員任務櫃台任務板承接任務。不論從哪邊承接，任務內容都不會改變。")
                    .lineLimit(Int.max)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 15))

                Text("用餐")
                .font(Font.system(size:30))
                .fontWeight(.bold)
                .foregroundColor(Color(red: 129/255, green: 0, blue: 0))
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 20, leading: 5, bottom: 0, trailing: 15))
                Image("用餐")
                    .resizable()
                    .scaledToFill()
                Text("用餐後可以暫時得到提升力量的效果。建議在執行任務前先用餐。")
                    .lineLimit(Int.max)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 15))
                Group{
                    Text("領取補給品")
                    .font(Font.system(size:30))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 129/255, green: 0, blue: 0))
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 20, leading: 5, bottom: 0, trailing: 15))
                    Image("領取補給品")
                        .resizable()
                        .scaledToFill()
                    Text("出發地點的營地有補給品BOX。帶上應急藥等對狩獵有幫助的道具出發吧。")
                        .lineLimit(Int.max)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 15))
                    
                    Text("尋找痕跡")
                    .font(Font.system(size:30))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 129/255, green: 0, blue: 0))
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 20, leading: 5, bottom: 0, trailing: 15))
                    Image("尋找痕跡")
                        .resizable()
                        .scaledToFill()
                    Text("出發地點的營地有補給品BOX。帶上應急藥等對狩獵有幫助的道具出發吧。")
                        .lineLimit(Int.max)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 15))
                    
                    Text("跟隨導蟲")
                    .font(Font.system(size:30))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 129/255, green: 0, blue: 0))
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 20, leading: 5, bottom: 0, trailing: 15))
                    Image("跟隨導蟲")
                        .resizable()
                        .scaledToFill()
                    Text("出發地點的營地有補給品BOX。帶上應急藥等對狩獵有幫助的道具出發吧。")
                        .lineLimit(Int.max)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 15))
                    
                    Group{
                        Text("狩獵")
                        .font(Font.system(size:30))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 129/255, green: 0, blue: 0))
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets(top: 20, leading: 5, bottom: 0, trailing: 15))
                        Image("狩獵")
                            .resizable()
                            .scaledToFill()
                        Text("發現了大型魔物就進行攻擊，開始狩獵吧。每隻魔物的特性都不同。盡量誘導魔物到有利戰鬥的地方，有時拉開距離也很重要。")
                            .lineLimit(Int.max)
                            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 15))
                        Group{
                            Text("剝取素材")
                            .font(Font.system(size:30))
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 129/255, green: 0, blue: 0))
                            .multilineTextAlignment(.center)
                            .padding(EdgeInsets(top: 20, leading: 5, bottom: 0, trailing: 15))
                            Image("剝取素材")
                                .resizable()
                                .scaledToFill()
                            Text("成功討伐魔物後，就剝取「素材」吧。")
                                .lineLimit(Int.max)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 15))
                            
                            Text("任務報酬")
                            .font(Font.system(size:30))
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 129/255, green: 0, blue: 0))
                            .multilineTextAlignment(.center)
                            .padding(EdgeInsets(top: 20, leading: 5, bottom: 0, trailing: 15))
                            Image("任務報酬")
                                .resizable()
                                .scaledToFill()
                            Text("在結算畫面可獲得素材等任務報酬與獎金。")
                                .lineLimit(Int.max)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 15))
                            
                            Text("強化裝備")
                            .font(Font.system(size:30))
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 129/255, green: 0, blue: 0))
                            .multilineTextAlignment(.center)
                            .padding(EdgeInsets(top: 20, leading: 5, bottom: 0, trailing: 15))
                            Image("強化裝備")
                                .resizable()
                                .scaledToFill()
                            Text("為了能挑戰任何任務與魔物，逐步強化裝備吧。")
                                .lineLimit(Int.max)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 15))
                        }
                    }
                }
            }
        }
        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.some(Color(red: 1, green: 1, blue: 153/255))))
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(red: 65/255, green: 105/255, blue: 225/255)))
        .padding(10)
    }
}

struct AppDetail_Previews: PreviewProvider {
    static var previews: some View {
        AppDetail()
    }
}
