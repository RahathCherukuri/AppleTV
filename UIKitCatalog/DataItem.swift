/*
    Copyright (C) 2016 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    A struct used throughout the sample to represent example data.
*/

import Foundation

struct DataItem: Equatable {
    // MARK: Types
    
    enum Group: String {
        case Scenery
        case Iceland
        case Lola
        case Baby
        
        static let allGroups: [Group] = [.Scenery, .Iceland, .Lola, .Baby]
    }
    
    // MARK: Properties
    
    let group: Group
    
    let number: Int
    
    let title: String
    
    var identifier: String {
        return "\(group.rawValue).\(number)"
    }
    
    var displayURL: NSURL {
        let components = NSURLComponents()
        components.scheme = "uikitcatalog"
        components.path = "dataItem"
        components.queryItems = [NSURLQueryItem(name: "identifier", value: identifier)]
        
        return components.URL!
    }
    
    var imageURL: NSURL {
        let mainBundle = NSBundle.mainBundle()
        guard let imageURL = mainBundle.URLForResource(imageName, withExtension: nil) else { fatalError("Error determining local image URL.") }
        
        return imageURL
    }
}

// MARK: Equatable

func ==(lhs: DataItem, rhs: DataItem)-> Bool {
    // Two `DataItem`s are considered equal if their identifiers and titles match.
    return lhs.identifier == rhs.identifier && lhs.title == rhs.title
}
