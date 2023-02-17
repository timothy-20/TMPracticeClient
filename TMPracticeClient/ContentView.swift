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

struct TMMemoListRow: View
{
    var memoItem: TMMemoItem
    
    var body: some View
    {
        VStack
        {
            VStack (alignment: .leading, spacing: 5.0)
            {
                HStack (spacing: 10)
                {
                    Image(systemName: "person")
                        .aspectRatio(contentMode: .fit)
                    Text(memoItem.title.capitalized)
                        .font(.title)
                        .fontWeight(.medium)
                    Spacer()
                }
                .frame(minHeight: 30)
                
                Text(memoItem.id)
                    .font(.caption2)
                    .foregroundColor(Color(uiColor: .lightGray))
                
                if let previewContext: String = memoItem.context
                {
                    Text(previewContext)
                        .font(.body)
                        .frame(height: 15.0)
                }
            }
            .padding(EdgeInsets(top: 7, leading: 15, bottom: 12, trailing: 15))
        }
        .background(.black)
        .listRowBackground(Color.clear)
        .foregroundColor(.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.white, lineWidth: 2)
        )
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
        VStack
        {
            List(self.memoItems)
            { memoItem in
                TMMemoListRow(memoItem: memoItem)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
            }
            .listStyle(.plain)
            .background(.black)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.white, lineWidth: 2)
            )
        }
    }
}

struct TMTitleView: View
{
    var body: some View
    {
        VStack (spacing: 5)
        {
            HStack (alignment: .center)
            {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22)
                    .foregroundColor(.white)
                    
                Text("Memo")
                    .font(.system(size: 22, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                    
                Spacer()
            }
            
            Divider()
                .frame(height: 1.5)
                .background(.white)
        }
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
                        .padding(.all, 5)
                }
            }
            .padding()
        }
        .background(.black)
        .padding()
        
//        GeometryReader
//        { geometry in
//            ScrollView
//            {
//                TMTitleView()
//                    .background(.brown)
//
//                TMMemoListView()
//                    .frame(height: geometry.size.height - 50)
//                    .background(.purple)
//            }
//            .background(.blue)
//            .scrollDisabled(true)
//        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
