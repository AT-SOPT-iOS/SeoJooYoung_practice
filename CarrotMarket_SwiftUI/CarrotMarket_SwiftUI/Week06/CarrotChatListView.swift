//
//  CarrotChatListView.swift
//  CarrotMarket_SwiftUI
//
//  Created by seozero on 5/17/25.
//

import SwiftUI

struct CarrotChatListView: View {
    let chats: [ChatModel] = chatDummy
    
    var body: some View {
        List(chats) { chat in
            CarrotChatListRow(
                profileImage: chat.profileImageName,
                name: chat.name,
                location: chat.location,
                message: chat.message,
                thumbnailImage: chat.thumbnailImageName
            )
        }
        .listStyle(.plain)
    }
}

struct CarrotChatListRow: View, Identifiable {
    var id = UUID()
    var profileImage: String
    var name: String
    var location: String
    var message: String
    var thumbnailImage: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image("profileMark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 44)
            VStack(alignment: .leading, spacing: 5) {
                HStack(alignment: .center) {
                    Text(name)
                        .font(.system(size: 20, weight: .semibold))
                    Text(location)
                        .font(.system(size: 16))
                        .foregroundStyle(.gray)
                }
                Text(message)
                    .font(.system(size: 16))
            }
            
            Spacer()
            
            Image("phone")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40)
        }
    }
}

struct ChatModel: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let message: String
    let profileImageName: String
    let thumbnailImageName: String
}

let chatDummy: [ChatModel] = [
    ChatModel(name: "바보", location: "문정동", message: "확인했습니다! 감사합니다 :)", profileImageName: "Image", thumbnailImageName: "Image"),
    ChatModel(name: "김가현", location: "구의동", message: "넵 수고하세용", profileImageName: "Image", thumbnailImageName: "Image"),
    ChatModel(name: "이은지", location: "보문동2가", message: "안녕하세요 답장이 너무 늦었네요 죄송…", profileImageName: "Image", thumbnailImageName: "Image"),
    ChatModel(name: "최주리", location: "면목동", message: "부리님이 이모티콘을 보냈어요.", profileImageName: "Image", thumbnailImageName: "Image"),
    ChatModel(name: "임재현", location: "자양제4동", message: "네.임재현씨", profileImageName: "Image", thumbnailImageName: "Image"),
    ChatModel(name: "이수용", location: "옥수동", message: "이수용이 이모티콘을 보냈어요.", profileImageName: "Image", thumbnailImageName: "Image"),
    ChatModel(name: "조영서", location: "면목동", message: "조영서가 이모티콘을 보냈어요.", profileImageName: "Image", thumbnailImageName: "thumb4"),
    ChatModel(name: "선영주", location: "면목동", message: "선영주가 이모티콘을 보냈어요.", profileImageName: "Image", thumbnailImageName: "thumb4"),
    ChatModel(name: "정정욱", location: "면목동", message: "ㅈㅇ정주우기 이모티콘을 보냈어요.", profileImageName: "Image", thumbnailImageName: "thumb4"),
    ChatModel(name: "진소은", location: "면목동", message: "진소으니 이모티콘을 보냈어요.", profileImageName: "Image", thumbnailImageName: "thumb4")
]


#Preview {
    CarrotChatListView()
}
