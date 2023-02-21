//
//  TMMemoListScrollView.swift
//  TMPracticeClient
//
//  Created by 임정운 on 2023/02/20.
//

import SwiftUI

struct TMMemoListScrollView: View {
    @State private var memoItems: [TMMemoListRowItem] = []
    @State private var scrollViewOffset: CGFloat = CGFloat.zero
    
    private var categoryNames: [String] = [
        "Genre",
        "Instrument",
        "Era",
        "Airtist",
        "Composition",
        "Mood",
        "Production",
        "Performance",
        "Soundtrack",
        "Lyrics"
    ]
    
    var body: some View {
        
        
        ScrollView {
            VStack {
                ZStack {
                    TMMemoListHeaderView()
                }
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(.green)
                
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Section {
                        VStack {
                            ForEach(self.memoItems) { item in
                                TMMemoListRow(memoItem: item)
                            }
                        }
                        
                    } header: {
                        ScrollView (.horizontal, showsIndicators: false) {
                            LazyHStack (spacing: 0) {
                                ForEach(self.categoryNames, id: \.self) { categoryName in
                                    Text(categoryName)
                                        .padding(.all, 10)
                                        .background (.regularMaterial, in: RoundedRectangle(cornerRadius: 10))
                                }
                                .padding(.all, 5)
                            }
                        }
                        .background {
                            if self.scrollViewOffset > 50 {
                                Color.white
                            }
                            
                            Color.clear
                        }
                    }
                }
            }
            .background(GeometryReader(content: { geometry in
                Color.clear.preference(key: TMScrollViewOffsetPreferenceKey.self, value: -geometry.frame(in: .named("TMContentScrollView")).origin.y)
            }))
            .onPreferenceChange(TMScrollViewOffsetPreferenceKey.self) { offset in
                self.scrollViewOffset = offset
            }
        }
        .coordinateSpace(name: "TMContentScrollView")
    }
}

struct TMScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = CGFloat.zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
