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
                        Button(action: {
                            menuState = .showImmersiveSpace
                        }, label: {
                            Text("1").font(.system(size: 50))
                        })
                        Button(action: {
                            menuState = .showImmersiveSpace
                        }, label: {
                            Text("2").font(.system(size: 20))
                        })
                        Button(action: {
                            menuState = .showImmersiveSpace
                        }, label: {
                            Text("3").font(.system(size: 30))
                        })
                        Button(action: {
                            menuState = .showImmersiveSpace
                        }, label: {
                            Text("4").font(.system(size: 50))
                        })

                    }
                    GridRow {
                        Button(action: {
                            menuState = .showImmersiveSpace
                        }, label: {
                            Text("5").font(.system(size: 30))
                        })
                        Button(action: {
                            menuState = .showImmersiveSpace
                        }, label: {
                            Text("6").font(.system(size: 50))
                        })
                        Button(action: {
                            menuState = .showImmersiveSpace
                        }, label: {
                            Text("7").font(.system(size: 60))
                        })
                        
                    }
                }.offset(z: 20)
                
                Button(action: {
                    print("back to initial content")
                    menuState = .showInitialContent
                }, label: {
                    Image(systemName: "arrowshape.turn.up.backward").padding(.horizontal, 20)
                }).padding(.vertical, 25)
            }
            
        }
    }
    
    
    @ViewBuilder private func makeSeriesFloatingButton() -> some View {
        
    }
}

struct MapPickPreview: View {
    @State var ms = MenuView.MenuState.showMapPickView
    var body: some View {
        MapPickView(menuState: $ms)
    }
}
    

#Preview {
    MapPickPreview()
        .previewLayout(.sizeThatFits)
}
