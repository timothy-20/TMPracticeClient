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

struct TMCollectionView: UIViewRepresentable
{
    var memos: [TMMemoItem]
    
    init()
    {
        self.memos = []
    }
    
    func makeUIView(context: Context) -> UICollectionView
    {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .clear
//        collectionView.dataSource = context.coordinator
        collectionView.register(UICollectionView.self, forCellWithReuseIdentifier: "TMCollectionCell")
        
        return collectionView;
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context)
    {
        
    }
}

class TMCoordinator: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private let parentCollectionView: TMCollectionView
    
    init(parentCollectionView: TMCollectionView)
    {
        self.parentCollectionView = parentCollectionView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return parentCollectionView.memos.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
    }
}

func makeCoordinator() -> TMCoordinator
{
    return TMCoordinator();
}

struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
