module Containers
  module LinkedList
    class SinglyLinkedList
      attr_accessor :head

      def append(element)
        current_node = @head

        while current_node.next?
          current_node = current_node.next_pointer
        end

        new_node = Node.new(element, nil)
        current_node.next_pointer = new_node
      end

      def empty?
        @head.data.nil?
      end

      def initialize(data = nil)
        @head = Node.new(data, nil)
      end

      def insert(position, element)
        current_node = @head
        index = 0

        previous_node = current_node
        next_node = current_node
        new_node = Node.new(element, nil)

        while current_node
          if index == position - 1
            previous_node = current_node
            next_node = current_node.next_pointer
          end
          index += 1
          current_node = current_node.next_pointer
        end

        new_node.next_pointer = next_node
        previous_node.next_pointer = new_node
      end

      def index_of(element)
        current_node = @head
        index = 0

        while current_node.next?
          if element == current_node.data
            return index
          end
          index += 1
          current_node = current_node.next_pointer
        end
        -1
      end

      def remove(element)
        current_node = @head
        previous_node = current_node
        next_node = current_node

        while current_node
          if current_node.data == element
            next_node = current_node.next_pointer
            current_node.next_pointer = nil
            previous_node.next_pointer = next_node
          end
          previous_node = current_node
          current_node = current_node.next_pointer
        end

        previous_node.next_pointer = next_node
      end

      def remove_at(position)
        current_node = @head
        index = 1
        previous_node = current_node
        next_node = current_node

        while current_node

          if position == index
            next_node = current_node.next_pointer
            current_node.next_pointer = nil
            previous_node.next_pointer = next_node
          end
          index += 1
          previous_node = current_node
          current_node = current_node.next_pointer
        end
      end

      def size
        current_node = @head
        index = 1

        while current_node.next?
          index += 1
          current_node = current_node.next_pointer
        end

        index
      end

      def to_s
        current_node = @head
        elements = []

        while current_node
          elements.push(current_node.data)
          current_node = current_node.next_pointer
        end

        elements.join(", ")
      end

    end
  end
end
