/// <reference types="cypress"/>

import { faker } from '@faker-js/faker'

describe('Validar mensagens de erro durante o registro e login', () => {
  it('Validar erro ao realizar login', () => {

    cy.loginError(faker.internet.email(), faker.internet.password(6))

  })

  it('Validar mensagem de erro ao tentar registrar com o campo "First Name" vazio', () => {

    cy.registerFirstNameEmpty(faker.person.lastName(), faker.internet.email(), faker.internet.password(6))

  })

  it('Validar mensagem de erro ao tentar registrar com o campo "Last Name" vazio', () => {
    
    cy.registerLastNameEmpty(faker.person.firstName(), faker.internet.email(), faker.internet.password(6))

  })

  it('Validar mensagem de erro ao tentar registrar com o campo "Email" vazio', () => {

    cy.registerEmailEmpty(faker.person.firstName(), faker.person.lastName(), faker.internet.password(6))

  })

  it('Validar mensagem de erro ao tentar registrar com um Email já existente', () => {

    const email = 'ramirobrandao@outlook.com';
    cy.registerEmailExisting(faker.person.firstName(), faker.person.lastName(), email, faker.internet.password(6))

  })

  it('Validar mensagem de erro ao tentar registrar com o campo "Password" vazio', () => {

    cy.registerPasswordEmpty(faker.person.lastName(), faker.person.lastName(), faker.internet.email())

  })

  it('Validar mensagem de erro ao tentar registrar com o campo Password diferente', () => {

    cy.registerPasswordDifferent(faker.person.lastName(), faker.person.lastName(), faker.internet.email(), faker.internet.password(6), faker.internet.password(6))

  })

  it('Validar mensagem de erro ao tentar registrar com uma senha abaixo do comprimento mínimo', () => {

    cy.registerPasswordSmall(faker.person.lastName(), faker.person.lastName(), faker.internet.email(), faker.internet.password(5))

  })
})