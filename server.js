const mysql = require('mysql');
const inquirer = require('inquirer');
const { printTable } = require('console-table-printer');
const figlet = require('figlet');
let roles;
let departments;
let managers;
let employees;
var connection = mysql.createConnection({
    host: "localhost",
    // Your port; if not 3306
    port: 3306,
    // Your username
    user: "root",
    // Your password
    password: "Padstowlane2!",
    database: "employees_db"
  });
  figlet('Showland Productions Employee Tracker', (err, result) => {
    console.log(err || result);
  });
  connection.connect(function(err) {
    if (err) throw err;
    start();
    getDepartments();
    getRoles();
    getManagers();
    getEmployees();
  });
  start = () => {
    inquirer
      .prompt({
        name: "choices",
        type: "list",
        message: "What would you like to do?",
        choices: ["ADD", "VIEW", "UPDATE", "DELETE", "EXIT"]
      })
      .then(function(answer) {
        if (answer.choices === "ADD") {
          addSomething();
        }
        else if (answer.choices === "VIEW") {
          viewSomething();
        } 
        else if (answer.choices === "UPDATE") {
          updateSomething();
        }
        else if (answer.choices === "DELETE") {
          deleteSomething();
        }
        else if (answer.choices === "EXIT") {
          figlet('Thanks for using FSC Employee Tracker', (err, result) => {
            console.log(err || result);
          });
          connection.end();
        }
        else{
          connection.end();
        }
      });
  }
getRoles = () => {
  connection.query("SELECT id, title FROM role", (err, res) => {
    if (err) throw err;
    roles = res;
    // console.table(roles);
  })
};
getDepartments = () => {
  connection.query("SELECT id, name FROM department", (err, res) => {
    if (err) throw err;
    departments = res;
    // console.log(departments);
  })
};
getManagers = () => {
  connection.query("SELECT id, first_name, last_name, CONCAT_WS(' ', first_name, last_name) AS managers FROM employee", (err, res) => {
    if (err) throw err;
    managers = res;
    // console.table(managers);
  })
};
getEmployees = () => {
  connection.query("SELECT id, CONCAT_WS(' ', first_name, last_name) AS Employee_Name FROM employee", (err, res) => {
    if (err) throw err;
    employees = res;
    // console.table(employees);
  })
};