//
//  MonsterData.swift
//  HW4
//
//  Created by blaire on 2020/1/14.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import Foundation

//MonsterData(name: "未知", classify: "未知", hardLevel: true, gender: "未知", huntNumber: 0, favorite: false, note: ""))

struct MonsterData: Identifiable, Codable
{
    var id = UUID()
    var name: String
    var classify: String
    var hardLevel: Bool
    var gender: String
    var huntNumber: Int
    var favorite: Bool
    var note: String
}
