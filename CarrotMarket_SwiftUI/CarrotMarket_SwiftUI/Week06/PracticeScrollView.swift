//
//  ScrollView.swift
//  CarrotMarket_SwiftUI
//
//  Created by seozero on 5/17/25.
//

import SwiftUI

struct PracticeScrollView: View {
    var body: some View {
        ScrollView() {
            VStack {
                ForEach(1..<100) {
                    Text("Item \($0)")
                        .font(.title)
                }
            }
            
            .frame(maxWidth: .infinity)
        }
        
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<10) {
                    Text("숫자 \($0)")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .background(Color.yellow)
                }
            }
            .frame(maxHeight: .infinity)
        }
        
        
    }
}

#Preview {
    PracticeScrollView()
}
