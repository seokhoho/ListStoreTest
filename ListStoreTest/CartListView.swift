//
//  CartListView.swift
//  ListStoreTest
//
//  Created by 정유진 on 2023/08/07.
//

import SwiftUI

struct CartListView: View {
    
    @ObservedObject var todayStore: HealthStore = HealthStore()
    
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(todayStore.today) { list in
                    NavigationLink {
                        CartDetailView(health: list)
                    } label: {
                        HStack {
                            
                            AsyncImage(url: list.image) { img in
                               img.resizable()
                                   .aspectRatio(contentMode: .fill)
                                   .frame(width: 150 ,height: 100)
                             
                           } placeholder: {
                               ProgressView()
                           }
                            
                            Text("\(list.name)")
                            Spacer()
                            Text("\(list.bodyType.rawValue)")
                        }//Vstack
                        .foregroundColor(.brown)
                        .cornerRadius(15)
                        
                    }//NavigationLink
                }//ForEach
                .onDelete { offsets in
                    
                    todayStore.today.remove(atOffsets: offsets)
                }
                
                
            }//list
            .navigationTitle("오늘 할 운동")
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        StoreListView(store: todayStore)
                    } label: {
                        VStack {
                            Image(systemName:  "plus.app")
                                .font(.title3.bold())
                                .foregroundColor(.purple)
                                .padding()
                            
                        }
                    }
                }
            }
        }//navigationStack
    }
}

struct CartListView_Previews: PreviewProvider {
    static var previews: some View {
        CartListView()
    }
}
