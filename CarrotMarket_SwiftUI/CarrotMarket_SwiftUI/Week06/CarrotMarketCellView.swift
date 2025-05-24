//
//  CarrotMarketCellView.swift
//  CarrotMarket_SwiftUI
//
//  Created by seozero on 5/17/25.
//

import SwiftUI

struct CarrotMarketCellView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomTrailing) {
                Image("phone")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                Image(systemName: "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25)
                    .foregroundStyle(.red)
                    .padding(7)
            }
            HStack(alignment: .center) {
                Text("아이폰 13")
                    .font(.system(size: 20, weight: .semibold))
                Text("군자 1동")
                    .font(.system(size: 16))
                    .foregroundStyle(.gray)
            }
            Text("1,000,000원")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.orange)
        }
    }
}

#Preview {
    CarrotMarketCellView()
}
