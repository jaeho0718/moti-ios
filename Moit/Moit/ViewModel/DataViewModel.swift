//
//  DataViewModel.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import Foundation

class DataViewModel : ObservableObject {
    @Published var latestPosts : [Post] = [ .init(id: 0, writer_id: 0, title: "교촌 치킨"
                                                  ,content: "", location_id: 0,
                                                  max_participants: 10, price: 10, delivery_fee: 10)
                                            ,.init(id: 1, writer_id: 0, title: "교촌 치킨"
                                                   ,content: "", location_id: 0,
                                                   max_participants: 10, price: 10, delivery_fee: 10)
                                            ,.init(id: 2, writer_id: 0, title: "교촌 치킨"
                                                   ,content: "", location_id: 0,
                                                   max_participants: 10, price: 10, delivery_fee: 10)
                                            ,.init(id: 3, writer_id: 0, title: "교촌 치킨"
                                                   ,content: "", location_id: 0,
                                                max_participants: 10, price: 10, delivery_fee: 10)
                                            ,.init(id: 4, writer_id: 0, title: "교촌 치킨"
                                                   ,content: "", location_id: 0,
                                                   max_participants: 10, price: 10, delivery_fee: 10)
                                          ]
}
