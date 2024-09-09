// ***********************************************
// This example commands.js shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
//
//
// -- This is a parent command --
// Cypress.Commands.add('login', (email, password) => { ... })
//
//
// -- This is a child command --
// Cypress.Commands.add('drag', { prevSubject: 'element'}, (subject, options) => { ... })
//
//
// -- This is a dual command --
// Cypress.Commands.add('dismiss', { prevSubject: 'optional'}, (subject, options) => { ... })
//
//
// -- This will overwrite an existing command --
// Cypress.Commands.overwrite('visit', (originalFn, url, options) => { ... })

Cypress.Commands.add('registerSuccess', (firstName, lastName, email, password) => {
  cy.visit('/register')
  cy.get('[type="radio"]').last().check()
  cy.get('#FirstName').type(firstName)
  cy.get('#LastName').type(lastName)
  cy.get('[name="DateOfBirthDay"]').select('1')
  cy.get('[name="DateOfBirthMonth"]').select('3')
  cy.get('[name="DateOfBirthYear"]').select('1992')
  cy.get('#Email').type(email)
  cy.get('#Newsletter').uncheck()
  cy.get('#Password').type(password)
  cy.get('#ConfirmPassword').type(password)
  cy.get('#register-button').click()
  cy.get('.button-1 register-continue-button').should('exist')
})

Cypress.Commands.add('loginError', (email, password) => {
  cy.visit('/login')
  cy.get('#Email').type(email)
  cy.get('#Password').type(password)
  cy.get('form > .buttons > .button-1').click()
  cy.get('.message-error').contains('Login was unsuccessful. Please correct the errors and try again.')
})

Cypress.Commands.add('registerFirstNameEmpty', (lastName, email, password) => {
  cy.visit('/register')
  cy.get('#FirstName')
  cy.get('#LastName').type(lastName)
  cy.get('#Email').type(email)
  cy.get('#Password').type(password)
  cy.get('#ConfirmPassword').type(password)
  cy.get('#register-button').click()
  cy.get('.field-validation-error').contains('First name is required.')
})

Cypress.Commands.add('registerLastNameEmpty', (firstName, email, password) => {
  cy.visit('/register')
  cy.get('#FirstName').type(firstName)
  cy.get('#LastName')
  cy.get('#Email').type(email)
  cy.get('#Password').type(password)
  cy.get('#ConfirmPassword').type(password)
  cy.get('#register-button').click()
  cy.get('.field-validation-error').contains('Last name is required.')
})

Cypress.Commands.add('registerEmailEmpty', (firstName, lastName, password) => {
  cy.visit('/register')
  cy.get('#FirstName').type(firstName)
  cy.get('#LastName').type(lastName)
  cy.get('#Email')
  cy.get('#Password').type(password)
  cy.get('#ConfirmPassword').type(password)
  cy.get('#register-button').click()
  cy.get('.field-validation-error').contains('Email is required.')
})

Cypress.Commands.add('registerEmailExisting', (firstName, lastName, email, password) => {
  cy.visit('/register')
  cy.get('#FirstName').type(firstName)
  cy.get('#LastName').type(lastName)
  cy.get('#Email').type(email)
  cy.get('#Password').type(password)
  cy.get('#ConfirmPassword').type(password)
  cy.get('#register-button').click()
  cy.contains('The specified email already exists')
})

Cypress.Commands.add('registerPasswordEmpty', (firstName, lastName, email) => {
  cy.visit('/register')
  cy.get('#FirstName').type(lastName)
  cy.get('#LastName').type(firstName)
  cy.get('#Email').type(email)
  cy.get('#Password')
  cy.get('#ConfirmPassword')
  cy.get('#register-button').click()
  cy.get('.field-validation-error').contains('Password is required.')
})

Cypress.Commands.add('registerPasswordDifferent', (firstName, lastName, email, password, passwordDifferent) => {
  cy.visit('/register')
  cy.get('#FirstName').type(firstName)
  cy.get('#LastName').type(lastName)
  cy.get('#Email').type(email)
  cy.get('#Password').type(password)
  cy.get('#ConfirmPassword').type(passwordDifferent)
  cy.get('#register-button').click()
  cy.get('.field-validation-error').contains('The password and confirmation password do not match.')
})

Cypress.Commands.add('registerPasswordSmall', (firtName, lastName, email, password) => {
  cy.visit('/register')
  cy.get('#FirstName').type(firtName)
  cy.get('#LastName').type(lastName)
  cy.get('#Email').type(email)
  cy.get('#Password').type(password)
  cy.get('#ConfirmPassword').type(password)
  cy.get('#register-button').click()
  cy.get('.field-validation-error').contains('Password must meet the following rules: must have at least 6 characters')
})