//
//  HGridExampleView.swift
//  CarrotMarket_SwiftUI
//
//  Created by seozero on 5/24/25.
//

import SwiftUI

struct HGridExampleView: View {
    let rows = [
        GridItem(.flexible()),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, alignment: .top) {
                ForEach(1..<21) { index in
                    HGridExampleItem(index: index)
                }
            }
        }
        .padding(.leading, 20)
    }
}

struct HGridExampleItem: View {
    var index: Int
    
    var body: some View {
        ZStack {
            Color.orange
                .frame(width: 200, height: 200)
                .cornerRadius(30)
            
            Text("\(index)")
                .font(.title)
        }
    }
}

#Preview {
    HGridExampleView()
}
