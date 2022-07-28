class GetNode:

    def __init__(self):
        self.numOfItem = 0
        self.array = [None, None, None, None, None]

class HybridLinkedList:

    def __init__(self):
        self.front = None
        self.rare = None
        self.first = None
        self.last = None
        self.numOfNodes = 0

    def queue(self, data):

        if self.numOfNodes == 0:  # or self.rare == None or self.front == None # the first node
            new_node = GetNode()
            self.numOfNodes += 1
            self.front = new_node
            self.rare = new_node
            self.rare.array[0] = data
            self.first = 1
            self.last = 1
            self.rare.numOfItem += 1

        else:  # there is at least one node in the HibridLinkedList
            if self.rare.numOfItem == 5:  # there is no room for data, add a new node
                self.numOfNodes += 1
                new_node = GetNode()
                self.rare.link = new_node
                self.rare = new_node
                self.rare.array[0] = data
                self.rare.numOfItem += 1
                self.last = 1

            else:  # there is room in the node

                self.rare.array[self.last] = data
                self.last += 1
                self.rare.numOfItem += 1
        print(str(data) + ' added to the list')

    def dequeue(self):
        if self.front == None:  # the list is empty or no node at all
            return
        elif self.front.numOfItem == 0:  # the node is empty
            if self.front.link == self.rare:  # if it's the only node, delete it
                self.front = None
                self.rare = None
                self.first = None
                self.last = None
                self.numOfNodes = 0
            else:  # if it is not the only node, return it to the pool and link to the next node
                self.front = self.front.link
                self.front.link = None
                self.first = 1
        else:  # delete an item from the node
            print(str(self.front.array[self.first - 1]) + ' deleted')
            self.front.array[self.first - 1] = None
            self.front.numOfItem -= 1
            self.first += 1
            


# Test
new = HybridLinkedList()
new.queue('a')
new.queue('b')
new.queue('c')
new.queue('d')
new.queue('e')
new.queue('f')
new.queue('g')
new.queue('h')
new.queue('i')
new.queue('j')
new.queue('k')
new.queue('l')
new.dequeue()
new.dequeue()
