//
//  Item.swift
//  week6
//
//  Created by Jay Maloney on 11/18/15.
//  Copyright © 2015 Jay Maloney. All rights reserved.
//

import Foundation

class Item: Equatable {
    
    private let timeStampKey = "timeStamp"
    private let titleKey = "title"
    private let textKey = "text"
    
    var timeStamp: NSDate
    var title: String
    var text: String
    
    init(timeStamp:NSDate =  NSDate(), title:String, text:String) {
        
        self.timeStamp = timeStamp
        self.title = title
        self.text = text
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let timestamp = dictionary[timeStampKey] as? NSDate,
            let title = dictionary[titleKey] as? String,
            let text = dictionary[textKey] as? String else {
                
                self.timeStamp = NSDate()
                self.title = ""
                self.text = ""
                
                return nil
        }
        
        self.timeStamp = timestamp
        self.title = title
        self.text = text
        
    }
    
    func dictionaryCopy() -> [String: AnyObject] {
        
        let dictionary = [
            timeStampKey : self.timeStamp,
            titleKey : self.title,
            textKey : self.text
        ]
        
        return dictionary
    }

    
}

func == (lhs: Item, rhs: Item) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}
