// insertion sort by V8 Engine of Chrome and Merge sort by Mozilla Firefox and Safari. => sort()
//Start left pointer at first element of the array
//Start right pointer and last element pf the array
//Find the pivot (right + left / 2)
//leftPointer += 1, until >= pivot
//rightPointer --1 until <= pivot
//Check if leftPointer <= rightPointer, swap them
//Increment the leftPointer, decrement rightPointer
// If index of left pointer is still less than the index of the right pointer, then repeat the process;
//else return the index of the left pointer.

swap = (array, leftIndex, rightIndex) => {
  let temp = array[leftIndex];
  array[leftIndex] = array[rightIndex];
  array[rightIndex] = temp;
}


function partition(items, left, right) {
  var pivot   = items[Math.floor((right + left) / 2)], //middle element
      i       = left, //left pointer
      j       = right; //right pointer
  while (i <= j) {
      while (items[i] < pivot) {
          i++;
      }
      while (items[j] > pivot) {
          j--;
      }
      if (i <= j) {
          swap(items, i, j); //sawpping two elements
          i++;
          j--;
      }
  }
  return i;
}

function quickSort(items, left, right) {
  var index;
  if (items.length > 1) {
      index = partition(items, left, right); //index returned from partition
      if (left < index - 1) { //more elements on the left side of the pivot
          quickSort(items, left, index - 1);
      }
      if (index < right) { //more elements on the right side of the pivot
          quickSort(items, index, right);
      }
  }
  return items;
}


let array = [5,3,7,6,2,9];
console.log(quickSort(array, 0, array.length - 1));
