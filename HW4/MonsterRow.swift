//
//  MonsterRow.swift
//  HW4
//
//  Created by blaire on 2019/12/2.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import SwiftUI

struct MonsterRow: View {
    var monster: MonsterData
    let monsterClass = ["獸龍種", "牙龍種", "飛龍種", "魚龍種", "鳥龍種", "古龍種"]
    var flag: Int = 0
    
    var body: some View {
        HStack
        {
            if monster.favorite == true
            {
                Image("最愛")
                .resizable()
                .scaledToFill()
                .frame(width:50, height:50)
            }
            else
            {
                Image("最愛")
                .resizable()
                .scaledToFill()
                .frame(width:50, height:50)
                .hidden()
            }
            if monster.classify == "獸龍種"
            {
                Image("獸龍種")
                .resizable()
                .scaledToFill()
                .frame(width:50, height:50)
            }
            else if monster.classify == "牙龍種"
            {
                Image("牙龍種")
                .resizable()
                .scaledToFill()
                .frame(width:50, height:50)
            }
            else if monster.classify == "飛龍種"
            {
                Image("飛龍種")
                .resizable()
                .scaledToFill()
                .frame(width:50, height:50)
            }
            else if monster.classify == "魚龍種"
            {
                Image("魚龍種")
                .resizable()
                .scaledToFill()
                .frame(width:50, height:50)
            }
            else if monster.classify == "鳥龍種"
            {
                Image("鳥龍種")
                .resizable()
                .scaledToFill()
                .frame(width:50, height:50)
            }
            else if monster.classify == "古龍種"
            {
                Image("古龍種")
                .resizable()
                .scaledToFill()
                .frame(width:50, height:50)
            }
            else{
                Image("未知")
                .resizable()
                .scaledToFill()
                .frame(width:50, height:50)
            }
            
            VStack(alignment: .leading)
            {
                Text("\(monster.name), \(monster.classify), \(monster.gender)")
                Text("狩獵次數: " + String(monster.huntNumber))
                if monster.hardLevel == true
                {
                    Image("歷戰危險度")
                    .resizable()
                    .scaledToFill()
                    .frame(width:20, height:20)
                        .offset(x: 30,y: 0)
                }
            }
        }
    }
}


struct MonsterRow_Previews: PreviewProvider {
    static var previews: some View {
        MonsterRow(monster: MonsterData(name: "未知", classify: "未知", hardLevel: true, gender: "未知", huntNumber: 0, favorite: false, note: ""))
    }
}

