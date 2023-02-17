//
//  ContentView.swift
//  TMPracticeClient
//
//  Created by 임정운 on 2023/02/14.
//

import SwiftUI

struct TMMemoCollectionView: UIViewRepresentable
{
    class TMMemoCollectionViewCoordinator: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
    {
        private let parentCollectionView: TMMemoCollectionView
        
        init(parentCollectionView: TMMemoCollectionView)
        {
            self.parentCollectionView = parentCollectionView
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
        {
            return parentCollectionView.memos.count;
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
        {
            let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: TMMemoCollectionView.cellIdentifier, for: indexPath)
            cell.backgroundColor = .black
            
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
        {
            self.parentCollectionView.isSelected = true
            self.parentCollectionView.indexItem = indexPath.item
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            return CGSize(width: 200.0, height: 130.0)
        }
    }
    
    @Binding var isSelected: Bool?
    @Binding var indexItem: Int?
    public var memos: [TMMemoItem] = []
    public static let cellIdentifier: String = "TMMemoCollectionViewCell"
    
    func makeCoordinator() -> TMMemoCollectionViewCoordinator
    {
        return TMMemoCollectionViewCoordinator(parentCollectionView: self)
    }
    
    func makeUIView(context: Context) -> UICollectionView
    {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .clear
        collectionView.register(UICollectionView.self, forCellWithReuseIdentifier: TMMemoCollectionView.cellIdentifier)
        collectionView.dataSource = context.coordinator
        
        return collectionView;
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context)
    {
        
    }
}

struct TMMemoItem: Identifiable
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

struct TMLabelStyle: LabelStyle
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

struct TMMemoListRow: View
{
    public var memoItem: TMMemoItem
    
    var body: some View
    {
        ZStack
        {
//            LinearGradient(gradient: Gradient(colors: [.black, .blue]), startPoint: .top, endPoint: .bottomTrailing)
            
            VStack (alignment: .leading, spacing: 5)
            {
                Label
                {
                    Text(memoItem.title.capitalized)
                        .font(.system(size: 24))
                    
                    Spacer()
                    
                } icon:
                {
                    Image(systemName: "pencil.line")
                        .resizable()
                        .scaledToFit()
                        
                }
                .frame(minHeight: 30)
                .labelStyle(TMLabelStyle(spacing: 10, maxHeight: 20))

                Text(memoItem.id)
                    .font(.caption2)
                
                if let previewContext: String = memoItem.context
                {
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
        .overlay
        {
            RoundedRectangle(cornerRadius: 7)
                .stroke(
                    AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center, angle: .degrees(90)),
                    lineWidth: 2
                )
        }
    }
}

struct TMMemoListView: View
{
    private var memoItems: [TMMemoItem]
    
    init()
    {
        self.memoItems = [
            TMMemoItem(),
            TMMemoItem(),
            TMMemoItem(),
            TMMemoItem(context: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
            TMMemoItem(title: "timothy", context: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
        ]
    }
    
    var body: some View
    {
        List(self.memoItems)
        { memoItem in
            Section
            {
                TMMemoListRow(memoItem: memoItem)
                
            } header:
            {
                Text("header")
            }
        }
        .listStyle(InsetGroupedListStyle())
        .onAppear
        {
            UITableView.appearance().contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
        
//        .background(.gray)
//        .background(.gray)
//        .overlay (alignment: .top)
//        {
//            Rectangle()
//                .frame(width: nil, height: 3)
//                .cornerRadius(1.5)
//        }
//        .overlay (alignment: .bottom)
//        {
//            Rectangle()
//                .frame(width: nil, height: 3)
//                .cornerRadius(1.5)
//        }
    }
}

struct TMTitleView: View
{
    var body: some View
    {
        HStack (alignment: .center)
        {
            VStack (alignment: .leading)
            {
                Text("Primary")
                    .font(.title)
                    .foregroundStyle(.primary)
                
                Text("secondary")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        
//        VStack (spacing: 5)
//        {
//            HStack (alignment: .center)
//            {
//                Image(systemName: "square.and.pencil")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 22)
//                    .foregroundColor(.white)
//
//                Text("Memo")
//                    .font(.system(size: 22, weight: .medium, design: .rounded))
//                    .foregroundColor(.white)
//
//                Spacer()
//            }
//
//            Divider()
//                .frame(height: 1.5)
//                .background(.white)
//        }
    }
}

struct ContentView: View
{
    var body: some View
    {
        VStack
        {
            ScrollView
            {
                VStack (spacing: 5)
                {
                    TMTitleView()
                    TMMemoListView()
                        .frame(height: 300)
                        .padding(EdgeInsets(top: 10, leading: 3, bottom: 0, trailing: 3))
                }
            }
            .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
