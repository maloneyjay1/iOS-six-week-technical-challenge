//
//  ItemController.swift
//  week6
//
//  Created by Jay Maloney on 11/18/15.
//  Copyright © 2015 Jay Maloney. All rights reserved.
//

import Foundation

class ItemController {
    
    private let itemsKey = "items"
    
    static let sharedController = ItemController()
    
    var items: [Item]
    
    init() {
        self.items = []
        self.loadFromPersistentStorage()
    }
    
    
}
