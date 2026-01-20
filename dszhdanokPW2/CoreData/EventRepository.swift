//
//  EventRepository.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 19.01.26.
//

import CoreData

final class EventRepository {
    private let ctx = Persistence.shared.container.viewContext
    
    func fetchAll() throws -> [Event] {
        let req: NSFetchRequest<Event> = Event.fetchRequest()
        req.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        return try ctx.fetch(req)
    }
    
    @discardableResult
    func add(event: WishEventModel) -> Event {
        let w = Event(context: ctx)
        w.title = event.title
        w.eventDescription = event.description
        w.startDate = event.startDate
        w.endDate = event.endDate
        Persistence.shared.save()
        return w
    }
    
    
    func delete(_ event: Event) {
        ctx.delete(event)
        try? ctx.save()
        ctx.refreshAllObjects()
    }
}

// MARK: - обёртка над репозиторием
final class EventWorker {
    private let repo = EventRepository()
    private let ctx = Persistence.shared.container.viewContext
    
    func fetchAll() -> [Event] { (try? repo.fetchAll()) ?? [] }
    func add(event: WishEventModel) -> Event { repo.add(event: event) }
    func delete(_ event: Event) { repo.delete(event) }
    
}

