//
//  InstagramChatView.swift
//  CarrotMarket_SwiftUI
//
//  Created by seozero on 5/17/25.
//

import SwiftUI

struct InstagramChatView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<10) { _ in
                        ChatProfileView(color: .blue, size: 60)
                    }
                }
                .frame(maxHeight: 70)
            }
            .padding()
            
            List {
                ChatRow()
            }
            .listStyle(.plain)
            
            Spacer()
        }
        
    }
}

struct ChatRow: View {
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            ChatProfileView(color: .gray, size: 44)
            VStack(alignment: .leading) {
                Text("가현")
                    .font(.system(size: 20, weight: .bold))
                Text("안녕하세요!")
                    .font(.system(size: 16))
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Text("오전 9:41")
                .font(.system(size: 14))
                .foregroundStyle(.gray)
        }
    }
}

struct ChatProfileView: View {
    var color: Color
    var size: CGFloat
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Circle()
                .frame(width: size, height: size)
                .foregroundStyle(color)
            Circle()
                .frame(width: 13, height: 13)
                .foregroundStyle(.green)
        }
    }
}


#Preview {
    InstagramChatView()
}
