//
//  GameEntity+CoreDataProperties.swift
//  Gamer's Collection
//
//  Created by Rıdvan İmren on 26.01.2022.
//
//

import Foundation
import CoreData


extension GameEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameEntity> {
        return NSFetchRequest<GameEntity>(entityName: "GameEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var starRating: Int16
    @NSManaged public var imageURL: String?
    @NSManaged public var comment: String?
    @NSManaged public var genre: NSSet?
    @NSManaged public var screenShots: [String]?

    public var wrappedName: String {
        name ?? "Unknown name"
    }
    
    public var wrappedReleaseDate: String {
        releaseDate ?? "Unknown Date"
    }
    
    public var wrappedImageURL: String {
        imageURL ?? "Unknown Image"
    }
    

    public var wrappedComment: String {
        comment ?? "Unknown comment"
    }
    
    public var genreArray: [GenreEntity] {
        let set = genre as? Set<GenreEntity> ?? []
        
        return set.sorted {
            $0.wrappedGenre < $1.wrappedGenre
        }
    }
    
    public var wrappedScreenShots: [String] {
        screenShots ?? [wrappedImageURL]
    }

}

// MARK: Generated accessors for genre
extension GameEntity {

    @objc(addGenreObject:)
    @NSManaged public func addToGenre(_ value: GenreEntity)

    @objc(removeGenreObject:)
    @NSManaged public func removeFromGenre(_ value: GenreEntity)

    @objc(addGenre:)
    @NSManaged public func addToGenre(_ values: NSSet)

    @objc(removeGenre:)
    @NSManaged public func removeFromGenre(_ values: NSSet)

}

extension GameEntity : Identifiable {

}
