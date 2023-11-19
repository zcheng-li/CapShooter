//
//  MapPickView.swift
//  CapShooter
//
//  Created by 1234567 on 2023/11/19.
//

import SwiftUI

struct MapPickView: View {
    private let captionSetoffZ: CGFloat = 20
    private let captionSize: CGFloat = 60
    
    @State private var number = 1
    @Binding var menuState: MenuView.MenuState
    
    var body: some View {
        ZStack {
            VStack {
                Text("关 卡")
                    .font(.system(size: captionSize, weight: .black, design: .rounded))
                    .offset(z: captionSetoffZ)
                
                Grid(alignment: .leadingFirstTextBaseline) {
                    GridRow {
                        Button("1") { 
                            menuState = .showImmersiveSpace }
                        Button("2") { }
                        Button("3") { }
                        Button("4") { }

                    }
                    GridRow {
                        Button("5") { }
                        Button("6") { }
                        Button("7") { }
                        
                    }
                  
                }.offset(z: 20)
            }
            
        }
    }
}
    

//#Preview {
//    MapPickView().previewLayout(.sizeThatFits)
//}
