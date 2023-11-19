//
//  ImmersiveView.swift
//  CapShooter
//
//  Created by 1234567 on 2023/11/18.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var tap: some Gesture {
        SpatialTapGesture()
            .targetedToAnyEntity()
            .onEnded { value in
                print(value.entity)
            }
    }
    
    
    var body: some View {
        RealityView(make: {content, attachments in
            // Add the initial RealityKit content
            if let gamePlane = try? await Entity(named: "game_plane", in: realityKitContentBundle) {
                content.add(gamePlane)
            }
        }, update: {content, attachments in
            if let attachmentEntity = attachments.entity(for: "test") {
                content.add(attachmentEntity)
            }
            
        }, attachments: {
            Attachment(id: "test") {
                Text("hi")
            }
        }).gesture(tap)
        
    }

}


#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
