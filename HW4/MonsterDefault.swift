//
//  MonsterDefault.swift
//  HW4
//
//  Created by blaire on 2019/12/2.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import Foundation

class MonsterDefault: ObservableObject
{
    @Published var monsters = [MonsterData]()
    {
        didSet{
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(monsters)
            {
                UserDefaults.standard.set(data, forKey: "monsters")
            }
        }
    }
    
    init()
    {
        if let data = UserDefaults.standard.data(forKey: "monsters")
        {
            let decoder = JSONDecoder()
            if let decodeData = try? decoder.decode([MonsterData].self, from: data)
            {
                monsters = decodeData
            }
        }
    }
}
