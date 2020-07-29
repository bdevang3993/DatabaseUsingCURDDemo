//
//  EmployeeDataRwpository.swift
//  DatabaseUsingCURD
//
//  Created by devang bhavsar on 27/07/20.
//  Copyright © 2020 devang bhavsar. All rights reserved.
//

import UIKit
import CoreData
protocol EmployeeRepository {
    func create(employee: Employee)
    func getAll() -> [Employee]?
    func get(byIdentifier id: UUID) -> Employee?
    func update(employee: Employee) -> Bool
    func delete(record:UUID) -> Bool
}

struct EmployeeDataRepository : EmployeeRepository {
    func create(employee: Employee) {
        
        let cdEmployee = CDEmployee(context: PersistentStorage.shared.context)
        cdEmployee.email = employee.email
        cdEmployee.name = employee.name
        cdEmployee.id = employee.id
        cdEmployee.profilePic = employee.profilePic
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [Employee]? {
        
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDEmployee.self)
        
        var employees:[Employee] = []
        result.forEach { (cdEmployee) in
            employees.append(cdEmployee.converToEmployee())
        }
        return employees
    }
    
    func get(byIdentifier id: UUID) -> Employee? {
        let result = getCDEmployee(byIdentifier: id)
        guard result != nil else {return nil}
        return result?.converToEmployee()
    }
    
    func update(employee: Employee) -> Bool{
        let cdEmployee = getCDEmployee(byIdentifier: employee.id!)
        guard cdEmployee != nil else {return false}
        
        cdEmployee?.email = employee.email
        cdEmployee?.name = employee.name
        cdEmployee?.profilePic = employee.profilePic
        
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func delete(record id: UUID) -> Bool{
        
        let cdEmployee = getCDEmployee(byIdentifier:id)
        guard cdEmployee != nil else {
            return false
        }
        
        PersistentStorage.shared.context.delete(cdEmployee!)
        PersistentStorage.shared.saveContext()
        return true
    }
    
    private func getCDEmployee(byIdentifier id:UUID) -> CDEmployee? {
        let fetchRquest = NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
               let predicate = NSPredicate(format: "id==%@", id as CVarArg)
               fetchRquest.predicate = predicate
               do {
                   let result = try PersistentStorage.shared.context.fetch(fetchRquest).first
                   guard result != nil else {return nil}
                   return result
               } catch let error {
                   debugPrint(error)
                   return nil
               }
    }
    
}
