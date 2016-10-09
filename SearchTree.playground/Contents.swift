//: Playground - noun: a place where people can play

import UIKit

class Node<T> {
	var value: T
	var children = [Node]()
	weak var parent: Node?
	
	init(value: T) {
		self.value = value
	}
	
	func add(child: Node) {
		children.append(child)
		child.parent = self
	}
}

let beverages = Node(value: "beverages")

let hotBeverages = Node(value: "hot")
let coldBeverages = Node(value: "cold")

beverages.add(child: hotBeverages)
beverages.add(child: coldBeverages)

let tea = Node(value: "tea")

let blackTea = Node(value: "black")
let greenTea = Node(value: "green")
let chaiTea = Node(value: "chai")

hotBeverages.add(child: tea)

tea.add(child: blackTea)
tea.add(child: greenTea)
tea.add(child: chaiTea)

let coffee = Node(value: "coffee")

hotBeverages.add(child: coffee)

let cocoa = Node(value: "cocoa")

hotBeverages.add(child: cocoa)

let soda = Node(value: "soda")

let gingerAleSoda = Node(value: "ginger ale")
let bitterLemonSoda = Node(value: "bitter lemon")

coldBeverages.add(child: soda)

soda.add(child: gingerAleSoda)
soda.add(child: bitterLemonSoda)

let milk = Node(value: "milk")

coldBeverages.add(child: milk)

print(beverages)

extension Node where T: Equatable {
	
	func search(value: T) -> Node? {
		
		if value == self.value {
			return self
		}
		
		for child in children {
			if let found = child.search(value: value) {
				return found
			}
		}
		
		return nil
	}
}

extension Node: CustomStringConvertible {
	
	var description: String {
		var text = "\(value)"
		
		if !children.isEmpty {
			text += " {" + children.map { $0.description }.joined(separator: ", ") + "} "
		}
		
		return text
	}
}

beverages.search(value: "cocoa")
beverages.search(value: "chai")
beverages.search(value: "bubbly")

let number = Node(value: 5)
