//
//  challengeMission2.swift
//  BasicAssignments
//
//  Created by Yeseul Jang on 1/9/26.
//

struct SortableBox<T> {
    var items: [T]
    
    mutating func sortItems() where T: Comparable {
           items.sort()
    }
}
