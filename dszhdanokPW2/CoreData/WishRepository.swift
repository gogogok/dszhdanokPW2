//
//  WishRepository.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 9.11.25.
//

import CoreData

final class WishRepository {
    private let ctx = Persistence.shared.container.viewContext
    
    func fetchAll() throws -> [Wish] {
        let req: NSFetchRequest<Wish> = Wish.fetchRequest()
        req.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: true)]
        return try ctx.fetch(req)
    }
    
    @discardableResult
    func add(text: String) -> Wish {
        let w = Wish(context: ctx)
        w.id = UUID()
        w.text = text
        w.createdAt = Date()
        Persistence.shared.save()
        return w
    }
    
    func update(_ wish: Wish, newText: String) {
        let ctx = Persistence.shared.container.viewContext
        ctx.performAndWait {
            wish.text = newText
            Persistence.shared.save()
        }
    }
    
    
    func delete(_ wish: Wish) {
        ctx.delete(wish)
        try? ctx.save()
        ctx.refreshAllObjects()
    }
}

// MARK: - обёртка над репозиторием
final class WishWorker {
    private let repo = WishRepository()
    private let ctx = Persistence.shared.container.viewContext
    
    func fetchAll() -> [Wish] { (try? repo.fetchAll()) ?? [] }
    func add(text: String) -> Wish { repo.add(text: text) }
    func update(_ wish: Wish, newText: String) { repo.update(wish, newText: newText) }
    func delete(_ wish: Wish) { repo.delete(wish) }
    
    func exportJSON() -> URL? {
        let ctx = Persistence.shared.container.viewContext
        
        ctx.performAndWait {
            if ctx.hasChanges {
                do { try ctx.save() } catch { print("export save error:", error) }
            }
            ctx.processPendingChanges()
        }
        
        let req: NSFetchRequest<Wish> = Wish.fetchRequest()
        req.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: true)]
        
        let items: [Wish]
        do { items = try ctx.fetch(req) } catch { print("export fetch error:", error); return nil }
        
        struct DTO: Codable { let id: String; let text: String; let createdAt: Date }
        let dtos = items.map {
            DTO(id: $0.id?.uuidString ?? "", text: $0.text ?? "", createdAt: $0.createdAt ?? Date())
        }
        
        let enc = JSONEncoder()
        enc.outputFormatting = [.prettyPrinted, .sortedKeys]
        enc.dateEncodingStrategy = .iso8601
        
        guard let data = try? enc.encode(dtos) else { return nil }
        
        let url = FileManager.default.temporaryDirectory
            .appendingPathComponent("wishes-\(UUID().uuidString).json")
        do {
            try data.write(to: url, options: .atomic)
            return url
        } catch {
            print("export write error:", error); return nil
        }
    }
    
}

