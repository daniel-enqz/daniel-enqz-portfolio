// Brute Force Approach: Iterate over all elements of teh array, that means, get all the sums possible of two digits.
// Time Complexity: O(n^2)
// Space Complexity: O(1)

bruteForceApproach = (array, targetValue) => {
  let finalResults = [];
  for (let i = 0; i < array.length; i++) {
    for (let j = i + 1; j < array.length; j++) {
      if (array[i] + array[j] === targetValue) {
        finalResults.push(array[i], array[j])
        return finalResults
      }
    }
  }
  return finalResults;
}


//Has Approach: Create a hash in which we will add all numbers from our array, and check if (targetValue - numberInIteration)
// gives us one of thos numbers
// Checking condition currentNumber = targetValue - numberInIteration
// Check if currentNumber is in hash, if it is, we return currentNumber, and numberInIteration
// If it's not in the hash, add the numberInIteration to hash
// Time Complexity: O(n)
// Space Complexity: O(n)

hashApproach = (array, targetValue) => {
  let hash = {};
  let currentNumber;

  for (let i = 0; i < array.length; i++) {
    currentNumber = targetValue - array[i];
    if (currentNumber in hash) {
      return[currentNumber, array[i]]
    } else {
      hash[array[i]] = true;
    }
  }
  return [];
}

//Sorting Approach:
// Tomando un array sorteado(selection sort), definimos un maximo y un minimo (siendo estos los extremos)
// Sumamos esos extremos. Si dan la suma del targetValue, we return those min and max.
// Si tenemos que el let targetValue; es mayor que la suma, quiere decir que podemos quitar el primer indice. min++
// Si tenemos que el let targetValue; es MENOR que la suma, quiere decir que podemos quitar el último indice. max--
//Si no encuentra la suma: return [];

//NOTE: SI UTILIZAMOS SELECTION SORT:
// TIME COMPLEXITY: O(n^2) | Ω(n^2)
//SPACE COMPLEXITY: O(1)
// ITERA SOBRE TODO EL ARRAY Y BUSCA SI HAY UN INDICE MENOR QUE EL INDICE ACTUAL, Y SI LO HAY HACE UN SWAP DE ESOS INDEX

// TIME COMPLEXITY: O(n log n) | Ω(1))
//SPACE COMPLEXITY: O(1)

sortingApproach = (array, targetValue) => {

  swap = (firstIndex, secondIndex) => {
    let temp = array[firstIndex]
    array[firstIndex] = array[secondIndex]
    array[secondIndex] = temp
  }

  indexOfMimum = (indexToCheck ) => {
    let minValue = array[indexToCheck];
    let minIndex = indexToCheck;

    for (let i = minIndex + 1; i < array.length; i++) {
      if (array[i] < minValue) {
        minValue = array[i];
        minIndex = i;
      }
    }
    return minIndex;
  }

  sortingArray = () => {
    let value;
    for (let i = 0; i < array.length; i++) {
      value = indexOfMimum(i)
      swap(value, i)
    }
    return array;
  }

  sortingArray();
  let max = array.length - 1;
  let min = 0

  for (let i = 0; i < array.length; i++) {
    if ((array[min] + array[max] === targetValue)) {
      return [array[min], array[max]]
    } else if (array[min] + array[max] > targetValue) {
      max --;
    } else {
      min ++;
    }
  }
  return [];
}


const array = [3, 2, 8, 7, 9]
const targetValue = 15
console.log(bruteForceApproach(array, targetValue));
console.log(hashApproach(array, targetValue));
console.log(sortingApproach(array, targetValue));
