//
//  AlineaStyle.swift
//  AlineaApp
//
//  Created by Jahanvi Vyas on 24/11/2020.
//  Copyright © 2020 Jahanvi Vyas. All rights reserved.
//

import Foundation
import UIKit

struct AlineaStyle {
    struct ColorPalette {
        static let cryptoColor = UIColor.color(fromHex: 0xfdd54f)
        static let purpleColor = UIColor.color(fromHex: 0xd1cddb)
    }
    
    struct Font {
        static let headerFont = UIFont(name: "HelveticaNeue-Bold", size: 25)
        static let titleFont = UIFont(name: "HelveticaNeue-Bold", size: 20)
        static let contentFont = UIFont(name: "HelveticaNeue", size: 20)
        static let smallContentFont = UIFont(name: "HelveticaNeue", size: 16)
    }
}
