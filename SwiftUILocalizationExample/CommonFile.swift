//
//  CommonFile.swift
//  LocalizationExampleSwiftUI
//
//  Created by MAC on 12/5/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

class UserSettings: ObservableObject {

    @Published var lang: String = "ja"

    var bundle: Bundle? {
        let b = Bundle.main.path(forResource: lang, ofType: "lproj")!
        return Bundle(path: b)
    }
}
