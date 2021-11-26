//
//  CoreDataService.swift
//  DicodingCatalogGame
//
//  Created by bevan christian on 17/08/21.
//

import Foundation
import CoreData

class CoreDataService: localRepoProtocol {
    static let shared = CoreDataService()
    let container: NSPersistentContainer?
    init() {
        container = NSPersistentContainer(name: "Game")
        container?.loadPersistentStores(completionHandler: { _, error in
            if error != nil {
                fatalError("erd gaiso di load")
            }
        })
    }
    
    func newTaskContext() -> NSManagedObjectContext {
        // gapakek viewcontext supaya diakses dari background
        let taskContext = container!.viewContext
        taskContext.undoManager = nil
        return taskContext
    }
    
    func addFav(_ name: String, _ genre: String, _ released: String, _ backImage: String, _ rating: String, _ id: Int64) {
        let context = newTaskContext()
        let game = Game(context: context)
        game.name = name
        game.genre = genre
        game.released = released
        game.backgroundImage = backImage
        game.rating = rating
        game.id = id
        
        do {
            try context.save()
        } catch {
            print(CoreDataError.saveError)
        }
        
    }
    
    func deleteFav(_ name: String, completion: @escaping() -> Void) {
        let context = newTaskContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Game")
        fetchRequest.predicate = NSPredicate(format: "name == %@", "\(name)")
        let delete = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        delete.resultType = .resultTypeCount
        if let delete = try? context.execute(delete) as? NSBatchDeleteResult {
            if delete.result != nil {
                fetchFav { _, _ in
                    print("reload")
                }
                completion()
            }
        }
        
    }
    
    func fetchFav(completion: @escaping([FavouriteModel]?, CoreDataError?) -> Void) {
        favList.removeAll()
        let context = newTaskContext()
        let request: NSFetchRequest<Game> = Game.fetchRequest()
        do {
            let hasil = try context.fetch(request)
            for data in hasil {
                print("fetch jumlah \(hasil)")
                let tampung = FavouriteModel(id: data.id,
                                             name: data.name ?? "",
                                             genre: data.genre ?? "",
                                             released: data.released ?? "",
                                             rating: data.rating ?? "",
                                             backgroundImage: data.backgroundImage ?? "")
                favList.append(tampung)
            }
            print("fetch data \(favList)")
            completion(favList, nil)
        } catch {
            completion(nil, CoreDataError.fetchError)
        }
        
    }
}
