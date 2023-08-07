//
//  CartData.swift
//  ListStoreTest
//
//  Created by 정유진 on 2023/08/07.
//

import Foundation
import SwiftUI

enum BodyType: String {
    case chest = "가슴"
    case leg = "다리"
    case back = "등"
}


struct HealthType: Identifiable {
    var id: UUID = UUID()
    var name: String
    var imageURL: String
    var bodyType: BodyType

    var image: URL {
        get {
            return URL(string: imageURL)!
        }
    }
}


class HealthStore: ObservableObject {
    
    @Published var today: [HealthType] = []
    
    let storeArray: [HealthType] = [
        HealthType(name: "벤치프레스", imageURL: "https://t1.daumcdn.net/cfile/tistory/99C34D4F5B39D25605", bodyType: .chest),
        HealthType(name: "스쿼트", imageURL: "https://blog.kakaocdn.net/dn/mgkYr/btqCWdIsEKP/j2MGQS1lWdFp9tvePTjqaK/img.png", bodyType: .leg),
        HealthType(name: "데드리프트", imageURL: "https://hunk12.cafe24.com/web/health_info/20130913_00.jpg", bodyType: .back)
    ]
    
    
    func addData(listData: HealthType) {
        today.append(listData)
    }
    
}
