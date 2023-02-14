//
//  ContentView.swift
//  TMPracticeClient
//
//  Created by 임정운 on 2023/02/14.
//

import SwiftUI

struct TMMemoItem
{
    
}

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

struct ContentView: View
{
    var body: some View
    {
        VStack
        {
            
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
