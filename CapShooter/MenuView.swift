//
//  MenuView.swift
//  CapShooter
//
//  Created by 1234567 on 2023/11/18.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct MenuView: View {
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    public enum MenuState {
        case showInitialContent
        case showMapPickView
        case showImmersiveSpace
    }
    
    @State private var menuState: MenuState = .showInitialContent

    @State private var selected = 1
    
    private let captionSetoffZ: CGFloat = 20
    private let captionSize: CGFloat = 100

    private let buttonSetoffZ: CGFloat = 50
    private let buttonSize: CGFloat = 100

    
    var body: some View {
        ZStack {
            Image("menu1")
            
            switch(menuState) {
            case .showInitialContent:
                VStack {
                    Text("弹瓶盖")
                        .font(.system(size: captionSize, weight: .black, design: .rounded))
                        .offset(z: captionSetoffZ)
                    
                    HStack {
                        Button(action: {
                            print("开始游戏")
                            withAnimation(.easeInOut(duration: 1)) {
                                menuState = .showMapPickView
                            }
                        }, label: {
                            Image(systemName: "arrowtriangle.right")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: buttonSize, height: buttonSize)
                                .padding(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/)
                            
                        })
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .offset(z: buttonSetoffZ)
                        
                        
                        Button(action: {
                            print("游戏设置")
                        }, label: {
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: buttonSize, height: buttonSize)
                                .padding(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/)
                        })
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .offset(z: buttonSetoffZ)

                        
                        Button(action: {
                            print("我的瓶盖")
                        }, label: {
                            Image(systemName: "bag")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: buttonSize, height: buttonSize)
                                .padding(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/)
                        })
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .offset(z: buttonSetoffZ)
                    }
                }
                
            case .showMapPickView:
                HStack {
                    MapPickView(menuState: $menuState)
                }
                
            case .showImmersiveSpace:
                ZStack {
                    
                    Button(action: {
                        Task {
                            print("back to map pick content")
                            await dismissImmersiveSpace()
                            menuState = .showMapPickView
                        }
                        
                    }, label: {
                        Image(systemName: "arrowshape.turn.up.backward").padding(.horizontal, 20)
                    }).padding(.vertical, 25)
                    
                }.onAppear(perform: {
                    Task {
                        await openImmersiveSpace(id: "ImmersiveSpace")
                    }
                })
                
            }

        }
    }
}

#Preview {
    MenuView()
}
