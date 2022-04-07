// Iterar por todo el array, para encontrar si hay un index más pequeño y que el index actual
// Si lo hay tenemos que darle un swap a esos indeces


// TIME COMPLEXITY: O(n^2) | Ω(n^2))
// SPACE COMPLEXITY O(1)


swap = (array, firstIndex, secondIndex) => {
  let temp = array[firstIndex];
  array[firstIndex] = array[secondIndex];
  array[secondIndex] = temp;
}


indexOfMinimum = (array, index) => {
  let minIndex = index;
  let minValue = array[index];

  for (let i = minIndex + 1; i < array.length; i++) {
    if (array[i] < minValue) {
      minIndex = i;
      minValue = array[i];
    }
  }
  return minIndex;
}


selectionSort = (array) => {
  let value;

  for (let i = 0; i < array.length; i++) {
    value = indexOfMinimum(array, i);
    swap(array, value, i);
  }
  return array;
}


let array = [22, 11, 99, 88, 9, 7, 42];
console.log(selectionSort(array));
