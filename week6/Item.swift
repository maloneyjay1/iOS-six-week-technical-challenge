//
//  Item.swift
//  week6
//
//  Created by Jay Maloney on 11/18/15.
//  Copyright © 2015 Jay Maloney. All rights reserved.
//

import Foundation

class Item: Equatable {
   
    private let titleKey = "title"
    private let textKey = "text"
    
  
    var title: String
    var text: String
    var pairNumber: Int = 0
    
    init(title:String, text:String) {
        
        self.title = title
        self.text = text
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let title = dictionary[titleKey] as? String,
            let text = dictionary[textKey] as? String else {
                
                self.title = ""
                self.text = ""
                
                return nil
        }

        self.title = title
        self.text = text
        
    }
    
    func dictionaryCopy() -> [String: AnyObject] {
        
        let dictionary = [
            titleKey : self.title,
            textKey : self.text
        ]
        
        return dictionary
    }

    
}

func == (lhs: Item, rhs: Item) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}
