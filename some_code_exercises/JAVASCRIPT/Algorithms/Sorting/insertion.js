// Starts Iterating from index[1], comparing with the leftIndex.
// If lefIndex is > index[1], slide leftIndex += 1. Place index[i] if is at 0 position or the leftIndex < index[i]
// Time Complexity:
// Space Complexity:

insert = (array, rightIndex, value) => {
  for (var j = rightIndex; j >= 0 && array[j] > value; j--) {
    array[j + 1] = array[j];
  }
  array[j + 1] = value;
}


insertionAlgorithm = (array) => {
  for (let i = 1; i < array.length; i++) {
    insert(array, i - 1, array[i])
  }
}


let array = [7, 4,  2, 8, 5, 3, 9];
insertionAlgorithm(array)
console.log(array);
