//
//  FirstPage.swift
//  HW4
//
//  Created by blaire on 2019/12/2.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import SwiftUI

struct FirstPage: View {
    @ObservedObject var monsterDefault = MonsterDefault()
    var body: some View
    {
        TabView
        {
            AppDetail()
            .tabItem
            {
                Image(systemName: "info.circle")
                Text("獵人筆記")
            }
            MonsterList(monsterDefault: self.monsterDefault)
            .tabItem
            {
                Image(systemName: "magnifyingglass")
                Text("狩獵紀錄")
            }
            Analysis(monsterData: self.monsterDefault)
            .tabItem
            {
                Image(systemName: "map")
                Text("狩獵分析")
            }
        }
    }
}

struct FirstPage_Previews: PreviewProvider {
    static var previews: some View {
        FirstPage()
    }
}
