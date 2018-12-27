//
//  LinkedList.swift
//  TapClient
//
//  Created by dev@iotize.com on 27/12/2018.
//

import Foundation


public final class LinkedList<T> {
	
	/// Linked List's Node Class Declaration
	public class LinkedListNode<T> {
		var value: T
		var next: LinkedListNode?
		weak var previous: LinkedListNode?
		
		public init(value: T) {
			self.value = value
		}
	}
	
	/// Typealiasing the node class to increase readability of code
	public typealias Node = LinkedListNode<T>
	
	public var first: Node? {
		return self.head
	}
	
	/// The head of the Linked List
	private(set) var head: Node?
	
	/// Computed property to iterate through the linked list and return the last node in the list (if any)
	public var last: Node? {
		guard var node = head else {
			return nil
		}
		
		while let next = node.next {
			node = next
		}
		return node
	}
	
	/// Computed property to check if the linked list is empty
	public var isEmpty: Bool {
		return head == nil
	}
	
	/// Computed property to iterate through the linked list and return the total number of nodes
	public var count: Int {
		guard var node = head else {
			return 0
		}
		
		var count = 1
		while let next = node.next {
			node = next
			count += 1
		}
		return count
	}
	
	/// Default initializer
	public init() {}
	
	
	/// Subscript function to return the node at a specific index
	///
	/// - Parameter index: Integer value of the requested value's index
	public subscript(index: Int) -> T {
		let node = self.node(at: index)
		return node.value
	}
	
	/// Function to return the node at a specific index. Crashes if index is out of bounds (0...self.count)
	///
	/// - Parameter index: Integer value of the node's index to be returned
	/// - Returns: LinkedListNode
	public func node(at index: Int) -> Node {
		assert(head != nil, "List is empty")
		assert(index >= 0, "index must be greater than 0")
		
		if index == 0 {
			return head!
		} else {
			var node = head!.next
			for _ in 1..<index {
				node = node?.next
				if node == nil {
					break
				}
			}
			
			assert(node != nil, "index is out of bounds.")
			return node!
		}
	}
	
	/// Append a value to the end of the list
	///
	/// - Parameter value: The data value to be appended
	public func append(_ value: T) {
		let newNode = Node(value: value)
		append(newNode)
	}
	
	/// Append a copy of a LinkedListNode to the end of the list.
	///
	/// - Parameter node: The node containing the value to be appended
	public func append(_ node: Node) {
		let newNode = node
		if let lastNode = last {
			newNode.previous = lastNode
			lastNode.next = newNode
		} else {
			head = newNode
		}
	}
	
	/// Append a copy of a LinkedList to the end of the list.
	///
	/// - Parameter list: The list to be copied and appended.
	public func append(_ list: LinkedList) {
		var nodeToCopy = list.head
		while let node = nodeToCopy {
			append(node.value)
			nodeToCopy = node.next
		}
	}
	
	/// Insert a value at a specific index. Crashes if index is out of bounds (0...self.count)
	///
	/// - Parameters:
	///   - value: The data value to be inserted
	///   - index: Integer value of the index to be insterted at
	public func insert(_ value: T, at index: Int) {
		let newNode = Node(value: value)
		insert(newNode, at: index)
	}
	
	/// Insert a copy of a node at a specific index. Crashes if index is out of bounds (0...self.count)
	///
	/// - Parameters:
	///   - node: The node containing the value to be inserted
	///   - index: Integer value of the index to be inserted at
	public func insert(_ newNode: Node, at index: Int) {
		if index == 0 {
			newNode.next = head
			head?.previous = newNode
			head = newNode
		} else {
			let prev = node(at: index - 1)
			let next = prev.next
			newNode.previous = prev
			newNode.next = next
			next?.previous = newNode
			prev.next = newNode
		}
	}
	
	/// Insert a copy of a LinkedList at a specific index. Crashes if index is out of bounds (0...self.count)
	///
	/// - Parameters:
	///   - list: The LinkedList to be copied and inserted
	///   - index: Integer value of the index to be inserted at
	public func insert(_ list: LinkedList, at index: Int) {
		guard !list.isEmpty else { return }
		
		if index == 0 {
			list.last?.next = head
			head = list.head
		} else {
			let prev = node(at: index - 1)
			let next = prev.next
			
			prev.next = list.head
			list.head?.previous = prev
			
			list.last?.next = next
			next?.previous = list.last
		}
	}
	
	/// Function to remove all nodes/value from the list
	public func removeAll() {
		head = nil
	}
	
	/// Function to remove a specific node.
	///
	/// - Parameter node: The node to be deleted
	/// - Returns: The data value contained in the deleted node.
	@discardableResult public func remove(node: Node) -> T {
		let prev = node.previous
		let next = node.next
		
		if let prev = prev {
			prev.next = next
		} else {
			head = next
		}
		next?.previous = prev
		
		node.previous = nil
		node.next = nil
		return node.value
	}
	
	/// Function to remove the last node/value in the list. Crashes if the list is empty
	///
	/// - Returns: The data value contained in the deleted node.
	@discardableResult public func removeLast() -> T {
		assert(!isEmpty)
		return remove(node: last!)
	}
	
	/// Function to remove a node/value at a specific index. Crashes if index is out of bounds (0...self.count)
	///
	/// - Parameter index: Integer value of the index of the node to be removed
	/// - Returns: The data value contained in the deleted node
	@discardableResult public func remove(at index: Int) -> T {
		let node = self.node(at: index)
		return remove(node: node)
	}
}
