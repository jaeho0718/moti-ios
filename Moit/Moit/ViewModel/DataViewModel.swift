//
//  DataViewModel.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import Foundation

class DataViewModel : ObservableObject {
    @Published var Posts : [Post] = [ .init(id: 0, writer_id: 0, title: "교촌 치킨"
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
                                            ,.init(id: 5, writer_id: 0, title: "교촌 치킨"
                                                   ,content: "", location_id: 0,
                                                   max_participants: 10, price: 10, delivery_fee: 10)
                                            ,.init(id: 6, writer_id: 0, title: "교촌 치킨"
                                                   ,content: "", location_id: 0,
                                                   max_participants: 10, price: 10, delivery_fee: 10)
                                            ,.init(id: 7, writer_id: 0, title: "교촌 치킨"
                                                   ,content: "", location_id: 0,
                                                   max_participants: 10, price: 10, delivery_fee: 10)
                                          ]
    @Published var usageItems : [Usage] = [
        .init(id: 0, date: Date(), point: 7300, restraunt: "교촌치킨 중앙대후문점")
        ,.init(id: 1, date: Date(), point: 7300, restraunt: "교촌치킨 중앙대후문점")
        ,.init(id: 2, date: Date(), point: 7300, restraunt: "교촌치킨 중앙대후문점")
        ,.init(id: 3, date: Date(), point: 7300, restraunt: "교촌치킨 중앙대후문점")
        ,.init(id: 4, date: Date(), point: 7300, restraunt: "교촌치킨 중앙대후문점")
    ]
    
    func searchRestaurant(text : String, completion : @escaping (Result<[Restaurant],Error>) -> Void){
        completion(.success([.init(id: 0, category_id: 1, open_at: 10, close_at: 10
            , location_id: 0, delivery_fee: 100, account: "교초치킨 중앙대후문점"
            , imageURL: "https://lh3.googleusercontent.com/proxy/CzSkRGTFEGRdBM8mq-WPgGWBgwzZT5dfmMAnA15zVmSVRrXbVzLIfsVfVyU3jtZIIh71Wu013tH_H2NRfALYsFYapXvLQ-8ulCp7rg")]))
    }
    
    func loadRestaurantMenu(id : Int, completion : @escaping (Result<[Menu],Error>) -> Void) {
        completion(.success([
            .init(id: 0, restaurant_id: 0, title: "교촌신화오리지날", price: 18000, image_id: 0, isSelected: false)
            ,.init(id: 1, restaurant_id: 0, title: "교촌오리지날", price: 18000, image_id: 0, isSelected: false)
            ,.init(id: 2, restaurant_id: 0, title: "교촌허니오리지날", price: 18000, image_id: 0, isSelected: false)
            ,.init(id: 3, restaurant_id: 0, title: "교촌신화오리지날", price: 18000, image_id: 0, isSelected: false)
        ]))
    }
}
