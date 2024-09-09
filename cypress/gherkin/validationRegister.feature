Feature: Validar criação de registro no site nopCommerce

  Scenario: CT001 - Validar acesso à página de registro
    Given que estou na página inicial do "nopCommerce" - https://demo.nopcommerce.com
    When clico no link "Register" no menu do header
    Then devo ser redirecionado para a página de registro com a URL contendo "/register"
    And a página deve exibir o título "Register" corretamente
    And o formulário de registro deve conter os campos:
      | Nome do campo    |
      | First Name       |
      | Last Name        |
      | Email            |
      | Password         |
      | Confirm Password |
    And o botão "Register" deve estar visível e habilitado

  Scenario: CT002 - Sucesso ao realizar um novo registro
    Given que estou na página "Register" do "nopCommerce" - https://demo.nopcommerce.com/register
    When preencho o campo "First Name" com "<firstName>"
    And preencho o campo "Last Name" com "<lastName>"
    And preencho o campo "Email" com "<email>"
    And preencho o campo "Password" com "<password>"
    And preencho o campo "Confirm Password" com "<password>"
    And clico no botão "Register"
    Then devo ser redirecionado para uma página com a URL contendo "/registerresult"
    And a página deve exibir a mensagem "Your registration completed" de forma visível
    And o botão "CONTINUE " deve estar visível e habilitado

    Examples:
      | firstName | lastName | email                     | password |
      | Ramiro    | Brandão  | ramirobrandao@outlook.com |   123456 |

  Scenario: CT003 - Validar erro ao realizar login
    Given que estou na página "Login" do "nopCommerce" - https://demo.nopcommerce.com/login
    When preencho o campo "Email" com "<email>"
    And preencho o campo "Email" com "<email>"
    And preencho o campo "Password" com "<password>"
    And clico no botão "Register"
    Then devo ser permanecer na página com a URL contendo "/login"
    And a página deve exibir a mensagem "Login was unsuccessful. Please correct the errors and try again." de forma visível
    And o botão "LOG IN" deve estar visível e habilitado para correção dos dados

    Examples:
      | email            | password |
      | incorrect@qa.com |   123456 |

  Scenario: CT004 - Validar mensagem de erro ao tentar registrar com o campo "First Name" vazio
    Given que estou na página "Register" do "nopCommerce" - https://demo.nopcommerce.com/register
    And preencho o campo "Last Name" com "<lastName>"
    And preencho o campo "Email" com "<email>"
    And preencho o campo "Password" com "<password>"
    And preencho o campo "Confirm Password" com "<password>"
    And clico no botão "Register"
    Then a página deve exibir a mensagem "First name is required." de forma visível
    And o botão "REGISTER" deve estar visível e habilitado para correção dos dados

    Examples:
      | firstName | lastName | email                     | password |
      |           | Brandão  | ramirobrandao@outlook.com |   123456 |

  Scenario: CT005 - Validar mensagem de erro ao tentar registrar com o campo "Last Name" vazio
    Given que estou na página "Register" do "nopCommerce" - https://demo.nopcommerce.com/register
    When preencho o campo "First Name" com "<firstName>"
    And preencho o campo "Email" com "<email>"
    And preencho o campo "Password" com "<password>"
    And preencho o campo "Confirm Password" com "<password>"
    And clico no botão "Register"
    Then a página deve exibir a mensagem "Last name is required." de forma visível
    And o botão "REGISTER" deve estar visível e habilitado para correção dos dados

    Examples:
      | firstName | lastName | email                     | password |
      | Ramiro    |          | ramirobrandao@outlook.com |   123456 |

  Scenario: CT006 - Validar mensagem de erro ao tentar registrar com o campo "Email" vazio
    Given que estou na página "Register" do "nopCommerce" - https://demo.nopcommerce.com/register
    When preencho o campo "First Name" com "<firstName>"
    And preencho o campo "Last Name" com "<lastName>"
    And preencho o campo "Password" com "<password>"
    And preencho o campo "Confirm Password" com "<password>"
    And clico no botão "Register"
    Then devo ser redirecionado para uma página com a URL contendo "/register"
    Then a página deve exibir a mensagem "Email is required." de forma visível
    And o botão "REGISTER" deve estar visível e habilitado para correção dos dados

    Examples:
      | firstName | lastName | email | password |
      | Ramiro    | Brandão  |       |   123456 |

  Scenario: CT007 - Validar mensagem de erro ao tentar registrar com um Email já existente
    Given que estou na página "Register" do "nopCommerce" - https://demo.nopcommerce.com/register
    When preencho o campo "First Name" com "<firstName>"
    And preencho o campo "Last Name" com "<lastName>"
    And preencho o campo "Email" com "<email>"
    And preencho o campo "Password" com "<password>"
    And preencho o campo "Confirm Password" com "<password>"
    And clico no botão "Register"
    And a página deve exibir a mensagem "The specified email already exists" de forma visível
    And o botão "REGISTER" deve estar visível e habilitado para correção dos dados

    Examples:
      | firstName | lastName | email                     | password |
      | Ramiro    | Brandão  | ramirobrandao@outlook.com |   123456 |

  Scenario: CT008 - Validar mensagem de erro ao tentar registrar com o campo "Password" vazio
    Given que estou na página "Register" do "nopCommerce" - https://demo.nopcommerce.com/register
    When preencho o campo "First Name" com "<firstName>"
    And preencho o campo "Last Name" com "<lastName>"
    And preencho o campo "Email" com "<email>"
    And clico no botão "Register"
    Then a página deve exibir a mensagem "Password is required. de forma visível
    And o botão "REGISTER" deve estar visível e habilitado para correção dos dados

    Examples:
      | firstName | lastName | email                     | password |
      | Ramiro    | Brandão  | ramirobrandao@outlook.com |          |

  Scenario: CT009 - Validar mensagem de erro ao tentar registrar com o campo Password diferente
    Given que estou na página "Register" do "nopCommerce" - https://demo.nopcommerce.com/register
    When preencho o campo "First Name" com "<firstName>"
    And preencho o campo "Last Name" com "<lastName>"
    And preencho o campo "Email" com "<email>"
    And preencho o campo "Password" com "<password>"
    And preencho o campo "Confirm Password" com "<password>"
    And clico no botão "Register"
    Then a página deve exibir a mensagem "The password and confirmation password do not match. de forma visível
    And o botão "REGISTER" deve estar visível e habilitado para correção dos dados

    Examples:
      | firstName | lastName | email                     | password | passwordDifferent |
      | Ramiro    | Brandão  | ramirobrandao@outlook.com |   123456 |            654321 |

  Scenario: CT010 - Validar mensagem de erro ao tentar registrar com uma senha abaixo do comprimento mínimo
    Given que estou na página "Register" do "nopCommerce" - https://demo.nopcommerce.com/register
    When preencho o campo "First Name" com "<firstName>"
    And preencho o campo "Last Name" com "<lastName>"
    And preencho o campo "Email" com "<email>"
    And preencho o campo "Password" com "<password>"
    And preencho o campo "Confirm Password" com "<password>"
    And clico no botão "Register"
    Then devo ser redirecionado para uma página com a URL contendo "/registerresult"
    And a página deve exibir a mensagem "Password must meet the following rules: must have at least 6 characters" de forma visível
    And o botão "CONTINUE" deve estar visível e habilitado para correção dos dados

    Examples:
      | firstName | lastName | email                     | password |
      | Ramiro    | Brandão  | ramirobrandao@outlook.com |      123 |
