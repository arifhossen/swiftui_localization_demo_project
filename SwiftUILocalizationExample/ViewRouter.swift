//
//  ViewRouter.swift
//  KhoaDao
//
//  Created by Arif hossen  on 17.12.19.
//  Copyright © 2019 Graaho. All rights reserved.
//
import Foundation
import Combine
import SwiftUI

class ViewRouter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    var currentPage: String = "Home" {
        didSet {
            objectWillChange.send(self)
        }
    }
}
