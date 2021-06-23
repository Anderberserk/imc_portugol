/*
*
*	Descrição : Esse programa calcula o IMC. O texto pode ser exibido em português, inglês ou espanhol, dependendo da escolha do usuário
* 	Autor : Anderson Damasceno
*	Criado em : 16/06/2021
*	Atualizado por: Anderson Damasceno
*	Última atualização : 23/06/2021
*/

programa
{
	inclua biblioteca Tipos --> tp
	inclua biblioteca Texto --> tx
	inclua biblioteca Matematica --> mat

	cadeia tx_entrada		//	Coletará entradas que serão números, a fim de evitar erros no código.
	inteiro it_idioma		//	Armazenará a escolha do idioma.
		
	funcao inicio()
	{
		cadeia tx_nome			//	Armazenará o nome do usuário.
		real rl_idade = 0.0		//	Armazenará a idade do usuário.
		real rl_altura = 0.0		//	Armazenará a altura do usuário.
		real rl_peso = 0.0		//	Armazenará o peso do usuário.
		real rl_imc			//	Armazenará o IMC quando for calculado.
		logico lg_ok			//	Verificará se a entrada do usuário está dentro do padrão esperado.

//	Escolhendo o idioma.

		faca
		{
			idioma (1)
			leia (tx_entrada)
			se (tx_entrada != "1" e tx_entrada != "2" e tx_entrada != "3") {
				idioma (2)
			}	
		}
		enquanto (tx_entrada != "1" e tx_entrada != "2" e tx_entrada != "3")		
		it_idioma = tp.cadeia_para_inteiro (tx_entrada,10)

//	Capturando o nome do usuário.
		idioma (3)
		leia (tx_nome)

//	Capturando a altura, peso e idade do usuário. Os valores devem ser números entre 1 e 999999.
//	O programa não continuará até receber uma altura, peso e idade válida.

		para (inteiro contador = 1; contador <= 3; contador++) 
		{
			faca
			{
				idioma (3 + contador)
				leia (tx_entrada)
				lg_ok = e_numero_valido ()
				se (lg_ok == verdadeiro)
				{
					escolha (contador)
					{
						caso 1:
							rl_altura = tp.cadeia_para_real (tx_entrada)
							pare
						caso 2:
							rl_peso = tp.cadeia_para_real (tx_entrada)
							pare
						caso contrario:
							rl_idade = tp.cadeia_para_real (tx_entrada)
							pare
					}
				}
				senao
				{
					idioma (6 + contador)
				}
			}
			enquanto (lg_ok == falso)
		}

//	Cálculo do IMC.

		rl_imc = imc (rl_altura, rl_peso)
		
//	Exibição do cálculo para o usuário.
		
		rl_imc = mat.arredondar (rl_imc, 2)
		idioma (10)
		escreva ("\n\n" + tx_nome + ", " + rl_idade + tx_entrada + rl_imc)
		
//	Fim do programa.

	}

//	Função que contém todas as frases que serão exibidas para o usuário.
//	A escolha da frase será realizada a partir da número do idioma e do parâmetro passado na chamada da função

	funcao idioma (inteiro it_parte)
	{
		escolha (it_parte)
		{
			caso 1:
				escreva ("Digite 1 para Português\nType 2 for English\nIngrese 3 para Español\n\n")
				pare
			caso 2:
				escreva ("\n\nOpção inválida | invalid option | Opción inválida\n\n")
				pare
			caso 3:
				escolha (it_idioma)
				{
			
					caso 1:
						escreva ("\n\nDigite seu nome:\n")
						pare
					caso 2:
						escreva ("\n\nType your name:\n")
						pare
					caso contrario:
						escreva ("\n\nIngrese su nombre:\n")
				}
				pare
			caso 4:
				escolha (it_idioma)
				{
					caso 1:
						escreva ("\n\nDigite sua altura em metros (use ponto como separador, ex: 1.72):\n")
						pare
					caso 2:
						escreva ("\n\nType your height in inches:\n")
						pare
					caso contrario:
						escreva ("\n\nIngrese su altura en metros (use punto como separador, ex: 1.72):\n")
				}
				pare
			caso 5:
				escolha (it_idioma)
				{
					caso 1:
						escreva ("\n\nDigite seu peso em quilogramas (use ponto como separador, ex: 82.5):\n")
						pare
					caso 2:
						escreva ("\n\nType your weight in pounds:\n")
						pare
					caso contrario:
						escreva ("\n\nIngrese su peso en kilogramos (use punto como separador, ex: 82.5):\n")
				}
				pare
			caso 6:
				escolha (it_idioma)
				{
					caso 1:
						escreva ("\n\nDigite sua idade:\n")
						pare
					caso 2:
						escreva ("\n\nType your age:\n")
						pare
					caso contrario:
						escreva ("\n\nIngrese su edad:\n")
				}
				pare
			caso 7:
				escolha (it_idioma)
				{
					caso 1:
						escreva ("\n\nAltura inválida.")
						pare
					caso 2:
						escreva ("\n\nInvalid height.")
						pare	
					caso contrario:
						escreva ("\n\nAltura inválida.")
				}
				pare

			caso 8:
				escolha (it_idioma)
				{
					caso 1:
						escreva ("\n\nPeso inválido.")
						pare
					caso 2:
						escreva ("\n\nInvalid weight.")
						pare
					caso contrario:
						escreva ("\n\nPeso inválido.")
				}
				pare
			caso 9:
				escolha (it_idioma)
				{
					caso 1:
						escreva ("\n\nIdade inválida.")
						pare
					caso 2:
						escreva ("\n\nInvalid age.")
						pare
					caso contrario:
						escreva ("\n\nEdad inválida.")
				}
				pare
			caso 10:
				escolha (it_idioma)
				{
					caso 1:
						tx_entrada = " ano(s), seu IMC é "
						pare
					caso 2:
						tx_entrada = " year(s)-old, your BMI is "
						pare
					caso contrario:
						tx_entrada = " año(s), su IMC es "
				}
				pare
				
		}
		retorne
	}

//	Função que valida se a entrada do usuário é um número maior que zero.

	funcao logico e_numero_valido ()
	{
		real rl_validacao
		logico lg_validacao
		
		se ((tp.cadeia_e_inteiro (tx_entrada,10) ou tp.cadeia_e_real (tx_entrada)) e tx.numero_caracteres (tx_entrada) < 7)
		{
			rl_validacao = tp.cadeia_para_real (tx_entrada)
			se ((rl_validacao > 0) == verdadeiro)
			{
				lg_validacao = verdadeiro
			}
			senao
			{
				lg_validacao = falso	
			}
		}
		senao
		{
			lg_validacao = falso
		}
		retorne lg_validacao
	}

//	Função que calcula o IMC. Caso o idioma seja inglês, o cálculo é um pouco diferente para compensar o fato de ser 
//	libras/polegadas em vez de quilogrmas/metros.

	funcao real imc (real rl_altura, real rl_peso)
	{
		real rl_imc
		rl_altura = mat.potencia (rl_altura, 2.0)
		se (it_idioma == 2)
		{
			rl_imc = (rl_peso/rl_altura) * 703
		}
		senao
		{
			rl_imc = rl_peso/rl_altura
		}
		retorne rl_imc		
	}

}
