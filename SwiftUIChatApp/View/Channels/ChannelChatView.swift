//
//  ChannelChatView.swift
//  SwiftUIChatApp
//
//  Created by Mehdi MMS on 19/08/2021.
//


import SwiftUI

struct ChannelChatView: View {
    @State var messageText: String = ""
    @ObservedObject var viewModel: ChannelChatViewModel
    @State private var selectedImage: UIImage?
    
    init(channel: Channel) {
        self.viewModel = ChannelChatViewModel(channel: channel)
    }
    
    var body: some View {
        VStack {
            
            ScrollViewReader { value in
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(viewModel.messages) { message in
                            ChannelMessageView(viewModel: ChannelMessageViewModel(message: message))
                                .id(message.id)
                        }
                    }.padding(.top)
                }
                .onReceive(viewModel.$messageToSetVisible, perform: { id in
                    value.scrollTo(id)
                })
            }
            
            CustomInputView(inputText: $messageText,
                            selectedImage: $selectedImage,
                            action: sendMessage)
                .padding()
            
        }
        .navigationTitle(viewModel.channel.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func sendMessage() {
        viewModel.sendMessage(messageText: messageText)
        messageText = ""
    }
}
