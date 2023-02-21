//
//  TMCreateMemoView.swift
//  TMPracticeClient
//
//  Created by 임정운 on 2023/02/20.
//

import SwiftUI
import UIKit

enum TMSongCategory {
    case genre
    case instrument
    case era
    case airtist
    case composition
    case mood
    case production
    case performance
    case soundtrack
    case lyrics
}

struct TMCreateMemoTextField: View {
    @FocusState private var isFocused: Bool
    @State private var text: String = ""
    
    private let labelName: String
    
    init(labelName: String) {
        self.labelName = labelName
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            TextField(text: self.$text) {
                Text(self.labelName)
            }
            .frame(minHeight: 40)
            .padding(.horizontal, 15)
            .background(.clear)
            .overlay {
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .stroke(Color.black, lineWidth: 2)
            }
            .keyboardType(.default)
            .focused(self.$isFocused)
            .onChange(of: self.isFocused, perform: { isFocused in
                if (isFocused) {
                    print("Focused.")
                    
                } else {
                    print("Focused else.")
                }
            })
            .onSubmit {
                print("submit.")
            }
            
            Text(self.labelName)
                .padding(.horizontal, 10)
                .background(.white)
                .offset(x: 15, y: -20)
            
//            if (self.isFocused)
                
        }
    }
}

struct TMCreateMemoView: View {
    var body: some View {
//        Gesture test
//        ZStack {
//            Rectangle()
//                .fill(.yellow)
//                .frame(width: 200, height: 150)
//                .onTapGesture {
//                    print("rect")
//                }
//
//            Circle()
//                .fill(.red)
//                .frame(width: 100, height: 100)
//                .onTapGesture {
//                    print("circle")
//                }
//        }
//        .background(.clear)
        
        VStack {
            TMCreateMemoTextField(labelName: "title")
                .padding()

            TMCreateMemoTextField(labelName: "name")
                .padding()
                .background(.green)

            TMCreateMemoTextField(labelName: "description")
                .padding()
                .background(.green)

            Spacer()
        }
        .contentShape(Rectangle())
        .gesture(
            TapGesture().onEnded({ _ in
                print("touch background")
                self.hideKeyboard()
            })
        )
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() -> Void {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct TMCreateMemoView_Previews: PreviewProvider {
    static var previews: some View {
        TMCreateMemoView()
            .preferredColorScheme(.light)
    }
}
