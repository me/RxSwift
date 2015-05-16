//
//  Mutable.swift
//  Rx
//

import Foundation
// A Variable subclass that caches the last value, to help
// bridging imperative code
public class Mutable<Element>: Variable<Element> {
    public var value:Element {
        didSet {
            on(.Next(Box(value)))
        }
    }

    public override init(_ firstElement: Element) {
        value = firstElement
        super.init(firstElement)
    }

    public override func next(value: Element) {
        self.value = value
    }
}

public func << <E>(variable: Mutable<E>, element: E) {
    variable.next(element)
}