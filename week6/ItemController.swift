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
    
    func addItem(item: Item) {
        items.append(item)
        
        self.saveToPersistentStorage()
    }
    
    func removeItem(item: Item) {
        if let itemIndex = items.indexOf(item) {
            items.removeAtIndex(itemIndex)
        }
    }
    
    func loadFromPersistentStorage() {
        let itemDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(itemsKey) as? [[String:AnyObject]]
        
        if let itemDictionaries = itemDictionariesFromDefaults {
            
            self.items = itemDictionaries.map({Item(dictionary: $0)!})
        }
    }
    
    func saveToPersistentStorage() {
        
        let itemDictionaries = self.items.map({$0.dictionaryCopy()})
        
        NSUserDefaults.standardUserDefaults().setObject(itemDictionaries, forKey: itemsKey)
    }
    
}

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}
