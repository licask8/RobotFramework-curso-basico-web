*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br  
${HOME_PAGE}    //a[contains(@class,'nav-logo-link nav-progressive-attribute')]  
    
*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome  
    Maximize Browser Window 

Fechar o navegador
    Capture Page Screenshot  
    Close Browser
    
Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${HOME_PAGE}

Entrar no menu "Eletrônicos"
    Click Element    locator=//i[contains(@class,'hm-icon nav-sprite')]
    Wait Until Element Is Visible    locator=//div[@class='hmenu-item hmenu-title '][contains(.,'destaques')]
    Click Element    locator=(//a[@class='hmenu-item hmenu-compressed-btn'][contains(.,'ver tudo')])[1]
    Wait Until Element Is Visible    locator=//a[@class='hmenu-item'][contains(.,'Eletrônicos, TV e Áudio')]
    Click Element    locator=//a[@class='hmenu-item'][contains(.,'Eletrônicos, TV e Áudio')]
    Wait Until Element Is Visible    locator=//a[contains(.,'Tudo em Eletrônicos')]
    Click Element    locator=//a[contains(.,'Tudo em Eletrônicos')]

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=//h1[contains(.,'Eletrônicos e Tecnologia')]

Verificar se o título da página fica "${TITULO}"
      Title Should Be    title=${TITULO}    

Verificar se aparece a categoria "Computadores e Informática"   
      Element Should Be Visible    locator=//img[@src='https://images-na.ssl-images-amazon.com/images/G/32/BR-hq/2021/img/Consumer_Electronics/Storefronts/Electronics/956.Storefront_categoria_computadores_icons_240x270.jpg']


teste de caso 2

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Click Element    locator=//input[contains(@type,'text')]
    Input Text    locator=//input[contains(@type,'text')]    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Button    locator=//input[contains(@type,'submit')]
Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Wait Until Element Is Visible    locator=(//span[contains(.,'Console Xbox Series S')])[2]
    Scroll Element Into View    locator=(//span[contains(.,'Console Xbox Series S')])[2]
    Set Focus To Element    locator=(//span[contains(.,'Console Xbox Series S')])[2]
    


# GHERKIN STEPS

Dado que estou na home page da Amazon.com.br    
    Acessar a home page do site Amazon.com.br

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Wait Until Element Contains    locator=//h1[contains(.,'Eletrônicos e Tecnologia')]    text=Eletrônicos e Tecnologia

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"                

Então o título da página deve ficar "${TITULO}"
   Title Should Be    title=${TITULO}


###


Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
Quando pesquisar pelo produto "${PRODUTO}"
     Digitar o nome de produto "${PRODUTO}" no campo de pesquisa 
     Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"  
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página   
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
#### test case 03

Entrar no site
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${HOME_PAGE}

Digitar o nome do controle "${CONTROLE}"
    Click Element    locator=//input[contains(@type,'text')]
    Input Text    locator=//input[contains(@type,'text')]    text=${CONTROLE}
Clicar no botão pesquisa
    Click Button    locator=//input[contains(@type,'submit')]    
    
Verificar o resultado da pesquisa e se está listando o produto "Controle DualSense - branco"
     Wait Until Element Is Visible        locator=//img[contains(@alt,'Controle DualSense - Branco')]
    Set Focus To Element    locator=//img[contains(@alt,'Controle DualSense - Branco')]
