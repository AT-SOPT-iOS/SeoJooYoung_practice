//
//  ProfileView.swift
//  CarrotMarket_SwiftUI
//
//  Created by seozero on 5/17/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("profileMark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(30)
            HStack {
                VStack(alignment: .leading) {
                    Text("마크")
                        .font(.headline)
                    Text("1999년 8월 2일 / 천재 아이돌")
                        .font(.subheadline)
                }
                Spacer()
            }
            .padding(15)
            .background(Color.white.opacity(0.7))
        }
        .padding(20)
    }
}

#Preview {
    ProfileView()
}
