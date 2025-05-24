//
//  VGridExampleView.swift
//  CarrotMarket_SwiftUI
//
//  Created by seozero on 5/24/25.
//

import SwiftUI

struct VGridExampleView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(1..<21) { index in
                        VGridExampleItem(itemIndex: index)
                            
                    }
                }
            }
            .padding(.horizontal)
    }
}

struct VGridExampleItem: View {
    var itemIndex: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.white)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 120, height: 80)
                    .foregroundColor(.orange)
                Text("아이템 \(itemIndex)")
            }
            .padding()
        }
    }
}

#Preview {
    VGridExampleView()
}
