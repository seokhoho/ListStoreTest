//
//  CartDetailView.swift
//  ListStoreTest
//
//  Created by 정유진 on 2023/08/07.
//

import SwiftUI

struct CartDetailView: View {
    let health: HealthType
    var body: some View {
      
        VStack {
            
            AsyncImage(url: health.image) { img in
                
                img.resizable()
                    .aspectRatio(contentMode: .fit)
                
            } placeholder: {
                ProgressView()
            }
            
            Text("\(health.name)는")
            Text("\(health.bodyType.rawValue)운동이다")
            
        }
        .font(.largeTitle.bold())
        
        
    }
}

struct CartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CartDetailView(health:  HealthType(name: "벤치프레스", imageURL: "https://t1.daumcdn.net/cfile/tistory/99C34D4F5B39D25605", bodyType: .chest))
    }
}
