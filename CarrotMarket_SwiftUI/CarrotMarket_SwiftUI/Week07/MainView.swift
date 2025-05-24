//
//  MainView.swift
//  CarrotMarket_SwiftUI
//
//  Created by seozero on 5/24/25.
//

import SwiftUI

struct MainView: View {
    @State var isSheetPresented: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("메인 화면")
                .font(.largeTitle)
            
            Button("시트 열기") {
                isSheetPresented = true
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            SheetView(isPresented: $isSheetPresented)
        }
        .presentationDragIndicator(.hidden)
        .presentationDetents([.medium])
    }
}

#Preview {
    MainView()
}
