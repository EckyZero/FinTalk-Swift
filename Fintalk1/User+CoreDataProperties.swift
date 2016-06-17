//
//  User+CoreDataProperties.swift
//  Fintalk1
//
//  Created by Erik Andersen on 6/14/16.
//  Copyright © 2016 The Andersen Family Press. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension User {

    @NSManaged var id: NSNumber?
    @NSManaged var unitNumber: NSNumber?

}
