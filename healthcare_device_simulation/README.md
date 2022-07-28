# Wearable Healthcare Device Simulation:

The project was about simulating a wearable healthcare device, part of one of my MSC Data Science, Programming With Data, 2021.

The input data is randomly generated. The project's main challenge is finding a reasonable searching and
possibly sorting algorithm to satisfy the program's scalability.

Although approaching a logarithmic time complexity is the ideal solution, the nature of the
input data, at best, allows a linear time complexity; otherwise, in phase two, the program
should include a sorting, then binary search approach, which increases the time complexity
of the solution.

The function ComplexityTest(start = 1000, stop = 100000, step = 1000, name =
myHealthcare) will be used to test the time complexity of the functions in this project. The
function runs the input function repeatedly and generates a graph which is a visual
explanation of the elapsed time.
