//
//  SheetView.swift
//  CarrotMarket_SwiftUI
//
//  Created by seozero on 5/24/25.
//

import SwiftUI

struct SheetView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("SheetView")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                Button("시트 닫기") {
                    isPresented = false
                }
                .foregroundStyle(.white)
            }
        }
    }
}
