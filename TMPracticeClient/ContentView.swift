//
//  ContentView.swift
//  TMPracticeClient
//
//  Created by 임정운 on 2023/02/14.
//

import SwiftUI

struct ContentView: View {
    @State var isPresentModal: Bool = false
    
    var body: some View {
        TMCreateMemoView()
//        VStack (spacing: 0) {
//            TMMemoListScrollView()
//
//            Button {
//                self.isPresentModal = true
//
//            } label: {
//                Label {
//                    Text("Create new memo")
//                } icon: {
//                    Image(systemName: "plus")
//                }
//                .foregroundColor(.white)
//            }
//            .frame(maxWidth: .infinity, minHeight: 50)
//            .background {
//                Color.red
//            }
//            .sheet(isPresented: self.$isPresentModal) {
//                TMCreateMemoView()
//            }
//
//
////            HStack {
////
////            }
////            .frame(maxWidth: .infinity, maxHeight: 60)
////            .background {
////                Color.green
////            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
