//
//  TMMemoListHeaderView.swift
//  TMPracticeClient
//
//  Created by 임정운 on 2023/02/20.
//

import SwiftUI

struct TMMemoListHeaderView: View {
    var body: some View {
        HStack {
            Text("Memo")
                .font(.system(size: 24, weight: .bold))
                .lineLimit(1)

            Spacer()
            
            HStack (alignment: .center, spacing: 15) {
                Button {
                    // ...
                    
                } label: {
                    Image(systemName: "magnifyingglass")
                }
                .tint(.black)
                
                Button {
                    // ...

                } label: {
                    Image(systemName: "person.crop.circle")
                }
                .tint(.black)
                
            }
        }
        .padding(.horizontal, 15)
    }
}
