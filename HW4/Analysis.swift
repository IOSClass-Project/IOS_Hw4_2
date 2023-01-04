//
//  Analysis.swift
//  HW4
//
//  Created by blaire on 2019/12/2.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import SwiftUI

struct Analysis: View {
    @State private var selectedAnalyzeItem = "圓餅圖"
    var analyzeItems = ["圓餅圖", "長條圖"]
    var monsterData: MonsterDefault
    var classAngles: [Angle]
    var huntNumberHeights: [Double]
    
    init(monsterData: MonsterDefault)
    {
        self.monsterData = monsterData
        var totalCount: Double = 0
        
        var classCount: [Double] = [0, 0, 0, 0]
        
        for data in monsterData.monsters
        {
            totalCount += 1
            if data.classify == "未知"
            {
                classCount[0] += 1
            }
            else if data.classify == "獸龍種"
            {
                classCount[1] += 1
            }
            else if data.classify == "飛龍種"
            {
                classCount[2] += 1
            }
            else if data.classify == "古龍種"
            {
                classCount[3] += 1
            }
        }
        
        var classPercentages: [Double] = [0, 0, 0, 0]
        classPercentages[0] = classCount[0] / totalCount
        classPercentages[1] = classCount[1] / totalCount
        classPercentages[2] = classCount[2] / totalCount
        classPercentages[3] = classCount[3] / totalCount
        
        classAngles = [Angle]()
        var classStartDegree: Double = 0
        for classPercentage in classPercentages
        {
            classAngles.append(.degrees(classStartDegree))
            classStartDegree += 360 * classPercentage
        }
        if classPercentages[3] == 1.0
        {
            classAngles[0] = .degrees(360)
        }
        
        var huntPercentages: [Double] = [0,0,0,0]
        huntNumberHeights = [0,0,0,0]
        
        huntPercentages[0] = classCount[0] / totalCount
        huntNumberHeights[0] = huntPercentages[0] * 240
        huntPercentages[1] = classCount[1] / totalCount
        huntNumberHeights[1] = huntPercentages[1] * 240
        huntPercentages[2] = classCount[2] / totalCount
        huntNumberHeights[2] = huntPercentages[2] * 240
        huntPercentages[3] = classCount[3] / totalCount
        huntNumberHeights[3] = huntPercentages[3] * 240
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack
            {
                Image("mhwi")
                .resizable()
                .scaledToFill()
                .opacity(0.3)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .edgesIgnoringSafeArea(.all)
                
                VStack{
                    Text("請選擇分析項目：")
                    .padding(EdgeInsets(top: 50, leading: 10, bottom: 0, trailing: 10))
                    Picker(selection: self.$selectedAnalyzeItem, label: Text("請選擇分析項目："))
                    {
                        ForEach(self.analyzeItems, id: \.self)
                        {
                            (analyzeItem) in
                            Text(analyzeItem)
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(20)
                    
                    if self.monsterData.monsters.count != 0
                    {
                        if self.selectedAnalyzeItem == "圓餅圖"
                        {
                            Text("狩獵種類分析")
                            classPieChart(classAngles: self.classAngles)
                        }
                        else if self.selectedAnalyzeItem == "長條圖"
                        {
                            Text("狩獵分析")
                            huntNumberBarChart(huntNumberHeights: self.huntNumberHeights)
                        }
                    }
                }
            }
        }
    }
}

struct classPieChart: View
{
    var classAngles: [Angle]
    var body: some View
    {
        VStack
        {
            ZStack
            {
                PieChart(startAngle: classAngles[0], endAngle: classAngles[1])
                .fill(Color.blue)
                PieChart(startAngle: classAngles[1], endAngle: classAngles[2])
                .fill(Color.red)
                PieChart(startAngle: classAngles[2], endAngle: classAngles[3])
                .fill(Color.yellow)
                PieChart(startAngle: classAngles[3], endAngle: classAngles[0])
                .fill(Color.gray)
            }
            .frame(width: 200, height: 200)
            Spacer()
            .frame(height:40)
            classIcons()
        }
    }
}

struct classIcons: View
{
    var body: some View
    {
        HStack
        {
            Path(ellipseIn: CGRect(x: 0, y: 0, width: 30, height: 30))
            .fill(Color.blue)
            Text("未知")
            .padding(EdgeInsets(top: 0, leading: -50, bottom: 0, trailing: 10))
            Path(ellipseIn: CGRect(x: 0, y: 0, width: 30, height: 30))
            .fill(Color.red)
            Text("獸龍種")
            .padding(EdgeInsets(top: 0, leading: -50, bottom: 0, trailing: 10))
            Path(ellipseIn: CGRect(x: 0, y: 0, width: 30, height: 30))
            .fill(Color.yellow)
            Text("飛龍種")
            .padding(EdgeInsets(top: 0, leading: -50, bottom: 0, trailing: 10))
            Path(ellipseIn: CGRect(x: 0, y: 0, width: 30, height: 30))
            .fill(Color.gray)
            Text("古龍種")
            .padding(EdgeInsets(top: 0, leading: -50, bottom: 0, trailing: 10))
        }
        .frame(width:300, height: 30)
    }
}

struct huntNumberBarChart: View
{
    var huntNumberHeights: [Double]
    var body: some View
    {
        HStack(spacing: 16)
        {
            huntNumberBar(huntNumberHeights: self.huntNumberHeights[0], info: "未知")
            huntNumberBar(huntNumberHeights: self.huntNumberHeights[1], info: "獸龍種")
            huntNumberBar(huntNumberHeights: self.huntNumberHeights[2], info: "飛龍種")
            huntNumberBar(huntNumberHeights: self.huntNumberHeights[3], info: "古龍種")
        }
        .frame(height: 270)
    }
}

struct huntNumberBar: View
{
    var huntNumberHeights: Double
    @State private var height: CGFloat = 0
    var info: String
    var body: some View
    {
        VStack
        {
            ZStack(alignment: .bottom)
            {
                Capsule().frame(width: 30, height: 240)
                .foregroundColor(Color(red: 127/255, green: 1, blue: 212/255))
                Capsule().frame(width: 30, height: height)
                .foregroundColor(Color(red: 42/255, green: 82/255, blue: 190/255))
                .animation(.linear(duration:  1))
                .onAppear
                {
                    self.height = CGFloat(self.huntNumberHeights)
                }
            }
            Text(info)
            .frame(height: 22)
            .padding(.top, 4)
        }
    }
}

struct Analysis_Previews: PreviewProvider {
    static var previews: some View {
        Analysis(monsterData: MonsterDefault())
    }
}
