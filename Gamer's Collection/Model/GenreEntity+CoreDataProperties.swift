//
//  GenreEntity+CoreDataProperties.swift
//  Gamer's Collection
//
//  Created by Rıdvan İmren on 26.01.2022.
//
//

import Foundation
import CoreData


extension GenreEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GenreEntity> {
        return NSFetchRequest<GenreEntity>(entityName: "GenreEntity")
    }

    @NSManaged public var genre: String?
    @NSManaged public var game: GameEntity?

    public var wrappedGenre: String {
        genre ?? "Unknown genre"
    }
}

extension GenreEntity : Identifiable {

}
