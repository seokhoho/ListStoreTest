//
//  StoreListView.swift
//  ListStoreTest
//
//  Created by 정유진 on 2023/08/07.
//

import SwiftUI

struct StoreListView: View {
    let store: HealthStore
    
    var body: some View {
        NavigationStack {
            List {
                ForEach (store.storeArray) { list in
                    Button {
                        store.addData(listData: list)
                    } label: {
                        HStack {
                            AsyncImage(url: list.image) { img in
                                img.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150 ,height: 120)
                                
                            } placeholder: {
                                ProgressView()
                            }
                            
                            Text("\(list.name)")
                            Spacer()
                            Text("\(list.bodyType.rawValue)")
                        }
                        .font(.title3)
                        .foregroundColor(.brown)
                        .cornerRadius(15)
                    }
                    
                    
                }
            }//List
            .navigationTitle("운동 종목 고르기")
        }//NavigationStack
    }
}

struct StoreListView_Previews: PreviewProvider {
    static var previews: some View {
        StoreListView(store: HealthStore())
    }
}
