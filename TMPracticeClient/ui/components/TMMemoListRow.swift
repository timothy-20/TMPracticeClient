//
//  TMMemoListRow.swift
//  TMPracticeClient
//
//  Created by 임정운 on 2023/02/20.
//

import SwiftUI

struct TMMemoListRowItem: Identifiable
{
    let id: String = UUID().uuidString
    var title: String
    var context: String?
    
    init(title: String = "untitled", context: String? = nil)
    {
        self.title = title
        self.context = context
    }
}

struct TMMemoListRowLabelStyle: LabelStyle
{
    public var spacing: CGFloat
    public var maxHeight: CGFloat?
    
    init(spacing: CGFloat, maxHeight: CGFloat? = 25) {
        self.spacing = spacing
        self.maxHeight = maxHeight
    }
    
    func makeBody(configuration: Configuration) -> some View
    {
        HStack (spacing: self.spacing)
        {
            configuration.icon
                .frame(maxHeight: self.maxHeight)
            
            configuration.title
                .font(.title)
                .fontWeight(.medium)
        }
    }
}

struct TMMemoListRow: View {
    public var memoItem: TMMemoListRowItem
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading, spacing: 5) {
                Label {
                    Text(memoItem.title.capitalized)
                        .font(.system(size: 24))
                    
                    Spacer()
                } icon: {
                    Image(systemName: "pencil.line")
                        .resizable()
                        .scaledToFit()
                }
                .frame(minHeight: 30)
                .labelStyle(TMMemoListRowLabelStyle(spacing: 10, maxHeight: 20))

                Text(memoItem.id)
                    .font(.caption2)
                
                if let previewContext: String = memoItem.context {
                    Text(previewContext)
                        .font(.body)
                        .frame(height: 15.0)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(EdgeInsets(top: 7, leading: 15, bottom: 12, trailing: 10))
            .foregroundColor(.black)
        }
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
        .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 5, trailing: 10))
        .cornerRadius(7)
        .overlay {
            RoundedRectangle(cornerRadius: 7)
                .stroke(
                    AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center, angle: .degrees(90)),
                    lineWidth: 2
                )
        }
    }
}
