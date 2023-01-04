//
//  MonsterList.swift
//  HW4
//
//  Created by blaire on 2019/12/2.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import SwiftUI

struct MonsterList: View {
    @ObservedObject var monsterDefault: MonsterDefault
    @State private var showEditMonster = false
    @State private var recoverData: [MonsterData] = []
    var body: some View {
        GeometryReader{ geometry in
            NavigationView{
                List{
                    ForEach(self.monsterDefault.monsters){ (monster) in
                        NavigationLink(destination: MonsterEditor(showEditMonster: self.$showEditMonster, monsterDefault: self.monsterDefault, editMonster: monster))
                        {
                            MonsterRow(monster: monster)
                        }
                    }
                    .onDelete { (indexSet) in
                        self.monsterDefault.monsters.remove(atOffsets: indexSet)
                    }
                }
                .navigationBarTitle("狩獵紀錄")
                .navigationBarItems(trailing: HStack
                {
                    Button(action:
                    {
                        var count = 0
                        for monster in MonsterDemo
                        {
                            print("add data: \(count)")
                            self.monsterDefault.monsters.append(monster)
                            count += 1
                        }
                    },label: {Text("歷史紀錄")})
                    .padding(.trailing, 20)
                    
                    Button(action:{self.showEditMonster = true},
                    label: {Image(systemName: "plus.circle.fill")})
                })
                .sheet(isPresented: self.$showEditMonster)
                {
                    NavigationView
                    {
                        MonsterEditor(showEditMonster: self.$showEditMonster, monsterDefault: self.monsterDefault)
                    }
                
                }
            }
        }
    }
}


struct MonsterList_Previews: PreviewProvider {
    static var previews: some View {
        MonsterList(monsterDefault: MonsterDefault())
    }
}

