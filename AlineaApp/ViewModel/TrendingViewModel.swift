//
//  TrendingViewModel.swift
//  AlineaApp
//
//  Created by Jahanvi Vyas on 26/11/2020.
//

import Foundation

protocol ListTrendingBusinessLogic {
    func fetchTrendingData()
}

protocol ListTrendingDataSource {
    var trending: [Trending] { get }
}

class TrendingViewModel: ListTrendingBusinessLogic, ListTrendingDataSource {
    
    var trending: [Trending] = []
    var topGainers: [Trending] = []
    var topSellers: [Trending] = []
    
    var sectionCount = 2
    
    init() {
        fetchTrendingData()
        
        topGainers = trending.filter ({ $0.isTopSellers == false })
        topSellers = trending.filter ({ $0.isTopSellers == true })
    }
    func fetchTrendingData() {
        
        let trendingItem1 = Trending(imageUrl: "test",
                                    title: "Medifast",
                                    description: "MED",
                                    value: +50.78,
                                    isTopSellers: false)
        
        
        
        let trendingItem2 = Trending(imageUrl: "test",
                                    title: "Pinterest",
                                    description: "PINS",
                                    value: -4.74,
                                    isTopSellers: false)
        
        
        let trendingItem3 = Trending(imageUrl: "test",
                                    title: "Slack Technologies",
                                    description: "WORK",
                                    value: -50.78,
                                    isTopSellers: false)
        
        
        let trendingItem4 = Trending(imageUrl: "test",
                                    title: "Evoqua Water",
                                    description: "AQUA",
                                    value: +5.78,
                                    isTopSellers: false)
        
        let trendingItem5 = Trending(imageUrl: "test",
                                    title: "Slack Technologies",
                                    description: "WORK",
                                    value: +5.78,
                                    isTopSellers: true)
        
        let trendingItem6 = Trending(imageUrl: "test",
                                    title: "Evoqua Water",
                                    description: "AQUA",
                                    value: +5.78,
                                    isTopSellers: true)
        
        trending.append(trendingItem1)
        trending.append(trendingItem2)
        trending.append(trendingItem3)
        trending.append(trendingItem4)
        trending.append(trendingItem5)
        trending.append(trendingItem6)
    }
}
