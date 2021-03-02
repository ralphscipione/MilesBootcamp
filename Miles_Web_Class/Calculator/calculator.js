// object to hold ui elements
const ui = {
  number1: document.getElementById('number1'),
  number2: document.getElementById('number2'),
  btnCalculate: document.getElementById('calculate'),
  btnClear: document.getElementById('clear'),
  result: document.getElementById('result'),
  operations: document.getElementsByName('operations')
};

// Operation constant values
const Operations = {
  add: "add",
  subtract: "subtract",
  multiply: "multiply",
  divide: "divide"
}
// validate input
function validateInput(num1, num2) {
  let valid = true;
  //debugger;
  if (isNaN(num1) || num1 === '' || isNaN(num2) || num2 === '') {
    valid = false;
  }
  return valid;
}
// get the chosen operation by returning its id
function getOperation(ops) {
  let id;
  for (let op of ops) {
    if (op.checked) {
      id = op.id;
    };
  }
  return id;
}
// reset
function clear() {
  ui.number1.value = '';
  ui.number2.value = '';
  ui.result.innerHTML = '';
  ui.operations[0].checked = true;
  ui.number1.focus();
}
// perform app logic
function calculate() {
  let num1 = parseInt(ui.number1.value),
    num2 = parseInt(ui.number2.value);
  //debugger;
  if (validateInput(num1, num2)) {

    let operation = getOperation(ui.operations);
    switch (operation) {
      case Operations.add:
        result.innerHTML = `The sum of adding ${num1} and ${num2} is ${num1 + num2}`;
        break;
      case Operations.subtract:
        result.innerHTML = `The difference of subtracting ${num2} from ${num1} is ${num1 - num2}`;
        break;
      case Operations.multiply:
        result.innerHTML = `The product of multiplying ${num1} and ${num2} is ${num1 * num2}`;
        break;
      case Operations.divide:
        if (num2 === 0) {
          result.innerHTML = `WARNING: Division by zero is not allowed.`;
        } else {
          result.innerHTML = `The quotient of dividing ${num1} by ${num2} is ${num1 / num2}`;
        }
        break;
    }
  } else {
    result.innerHTML = 'Please enter valid numbers as input.';
  }
}
// begin and init
function start() {
  ui.btnClear.addEventListener('click', clear);
  ui.btnCalculate.addEventListener('click', calculate);
}

start();