/// <reference types="cypress"/>

import { faker } from '@faker-js/faker'

describe('Fazer um registro com sucesso', () => {
  it('Sucesso ao realizar um novo registro', () => {

    cy.registerSuccess(faker.person.firstName(), faker.person.lastName(), faker.internet.email(), faker.internet.password(6))

  })
})