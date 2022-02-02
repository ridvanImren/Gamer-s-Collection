//
//  URLCache+imageCache.swift
//  Gamer's Collection
//
//  Created by Rıdvan İmren on 2.02.2022.
//

import Foundation

extension URLCache {
    
    static let imageCache = URLCache(memoryCapacity: 512*1000*1000, diskCapacity: 10*1000*1000*1000)
}

