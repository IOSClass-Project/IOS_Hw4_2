//
//  MonsterEditor.swift
//  HW4
//
//  Created by blaire on 2019/12/2.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import SwiftUI

struct MonsterEditor: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var showEditMonster: Bool
    var monsterDefault: MonsterDefault
    @State private var name = "未知"
    @State private var classify = "未知"
    @State private var hardLevel = false
    @State private var gender = "未知"
    @State private var huntNumber = 0
    @State private var favorite = false
    @State private var note = ""
    @State private var showNameAlert = false
    var editMonster: MonsterData?
    
    var body: some View {
        Form{
            monsterImage(classify: self.$classify, hardLevel: self.$hardLevel)
            monsterName(name: self.$name)
            monsterGender(gender: self.$gender)
            huntNumbers(huntNumber: self.$huntNumber)
            monsterFavorite(favorite: self.$favorite)
            monsterNote(note: self.$note)
        }
        .navigationBarTitle(editMonster == nil ? "狩獵新紀錄" : "舊有紀錄更新")
        .navigationBarItems(leading: Button("取消")
        {
            self.presentationMode.wrappedValue.dismiss()
            self.showEditMonster = false
        }
        .foregroundColor(Color.red),trailing: Button("儲存")
        {
            if self.name == ""
            {
                self.showNameAlert = true
            }
            else
            {
                let monster = MonsterData(name: self.name, classify: self.classify, hardLevel: self.hardLevel, gender: self.gender, huntNumber: self.huntNumber, favorite: self.favorite, note: self.note)
                if let editMonster = self.editMonster
                {
                    print("Edit old!")
                    let index = self.monsterDefault.monsters.firstIndex
                    {
                        return $0.id == editMonster.id
                    }!
                    self.monsterDefault.monsters[index] = monster
                }
                else
                {
                    print("Add New!")
                    self.monsterDefault.monsters.append(monster)
                }
                self.presentationMode.wrappedValue.dismiss()
                self.showEditMonster = false
            }
        }
        .alert(isPresented: $showNameAlert)
        {
            () -> Alert in
            return Alert(title: Text("錯誤!!"), message: Text("名字不得為空白"))
        })
        .onAppear
        {
            if let editMonster = self.editMonster
            {
                self.name = editMonster.name
                self.classify = editMonster.classify
                self.gender = editMonster.gender
                self.hardLevel = editMonster.hardLevel
                self.favorite = editMonster.favorite
                self.huntNumber = editMonster.huntNumber
                self.note = editMonster.note
            }
        }
    }
}

struct monsterImage: View
{
    var monsterClass = ["未知", "獸龍種", "飛龍種", "古龍種"]
    @Binding var classify: String
    @Binding var hardLevel: Bool
    var body: some View
    {
        //Text("幹")
        VStack
        {
            HStack{
                VStack{
                    Text("魔物種類(預覽圖):")
                    Toggle("                歷戰個體", isOn: $hardLevel)
                }
                Image(classify)
                .resizable()
                .scaledToFill()
                    .frame(width: 100, height: 100)
            }
            Picker(selection: $classify, label: Text("選擇種類")) {
                ForEach(monsterClass, id: \.self){ (monster) in
                    Text(monster)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}

struct monsterName: View
{
    @Binding var name: String
    var body: some View
    {
        HStack
        {
            Text("魔物名:")
            TextField("姓名", text: $name)
            .frame(width:250)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
            .multilineTextAlignment(.center)
        }
    }
}

struct monsterGender: View
{
    @Binding var gender: String
    var genders = ["未知", "公", "母", "有公有母"]
    var body: some View
    {
        Picker(selection: $gender, label: Text("性別"))
        {
            ForEach(genders, id: \.self)
            {
                (gender) in
                Text(gender)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct huntNumbers: View
{
    @Binding var huntNumber: Int
    var body: some View
    {
        VStack{
            Stepper(value: self.$huntNumber, in: 1...50) {
                Text("狩獵數: \(huntNumber)隻")
            }
        }
    }
}

struct monsterFavorite: View
{
    @Binding var favorite: Bool
    var body: some View
    {
        Toggle("是否加入我的最愛", isOn: $favorite)
            .frame(width:300)
    }
}

struct monsterNote: View
{
    @Binding var note: String
    var body: some View
    {
        VStack
        {
            HStack
            {
                Text("備註：")
                Spacer()
            }
            TextField("", text: $note)
            .frame(height: 100)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
        }
    }
}

struct MonsterEditor_Previews: PreviewProvider {
    static var previews: some View {
        MonsterEditor(showEditMonster: .constant(true), monsterDefault: MonsterDefault())
    }
}

