//
//  ChatView.swift
//  InstaProject
//
//  Created by OmerErbalta on 6.11.2023.
//

import SwiftUI

struct MessageBoxView: View {
    var body: some View {
        // 
        ScrollView{
            Text("Message Box")
            ForEach (0..<10 ){ i in
                MessageBoxCell()
                Divider()
            }
        }
    }
}

#Preview {
    MessageBoxView()
}
