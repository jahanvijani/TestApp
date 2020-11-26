//
//  ThemesViewModel.swift
//  AlineaApp
//
//  Created by Jahanvi Vyas on 25/11/2020.
//

import Foundation

protocol ListThemesBusinessLogic {
    func fetchThemes()
}

protocol ListThemesDataSource {
    var themes: [Theme] { get }
}

class ThemesViewModel: ListThemesDataSource, ListThemesBusinessLogic {
    
    var themes: [Theme] = []
    
    init() {
        fetchThemes()
    }
    func fetchThemes() {
        
        let themesTitle = ["Diversity & Inclusion", "Bold Biotech", "Crypto Central", "She runs it", "Clean & Green", "Cannabis-ness", "Power it", "Foodie Fun", "Art & Fashion", "Home is where the heart is"]
        
        for themeTitle in themesTitle {
            let theme = Theme(title: themeTitle)
            themes.append(theme)
        }
    }
}
