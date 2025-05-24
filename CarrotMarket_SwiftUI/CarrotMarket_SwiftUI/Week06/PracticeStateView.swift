//
//  PracticeStateView.swift
//  CarrotMarket_SwiftUI
//
//  Created by seozero on 5/17/25.
//

import SwiftUI

struct PracticeStateView: View {
    @State var name = "현수"
    
    var body: some View {
        Text("PracticeStateView")
        
        Text("이름 : \(name)")
        
        Button {
            if name == "현수" {
                self.name = "나연"
            } else {
                self.name = "현수"
            }
        } label: {
            Text("이름 바꾸기")
        }

    }
}

#Preview {
    PracticeStateView()
}
