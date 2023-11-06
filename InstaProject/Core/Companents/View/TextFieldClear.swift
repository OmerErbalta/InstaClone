//
//  TextFieldSendButton.swift
//  InstaProject
//
//  Created by OmerErbalta on 6.11.2023.
//

import SwiftUI

struct TextFieldClear: ViewModifier {
    @Binding var text: String
    func body(content: Content) -> some View {
        HStack {
            content
            
            if !text.isEmpty {
                Button(
                    action: {
                        
                    },
                    label: {
                        Image(systemName: "paperplane")
                            .foregroundColor(Color(UIColor.opaqueSeparator))
                    }
                )
            }
        }
    }
}
