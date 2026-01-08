//
//  도전 문제 2.swift
//  ch.2
//
//  Created by 변예린 on 1/8/26.
//

import Foundation

struct SortableBox<T> {
    var items: [T]
}

extension SortableBox where T: Comparable {
    mutating func sortItems() {
        items.sort(by: <)
    }
}
