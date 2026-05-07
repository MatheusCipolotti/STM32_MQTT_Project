/*
 * EUSART.c
 *
 *  Created on: 21 de abr. de 2026
 *      Author: matheus-cipolotti
 */

#include "stm32g0b0xx.h"

#include "main.h"
#include "EUSART.h"

void UART1_Init(unsigned long baudrate){
	//Habilita clock GPIOA e USART1
	RCC->IOPENR |= RCC_IOPENR_GPIOAEN;    										//Habilita Clock do GPIOA
	RCC->APBENR2 |= RCC_APBENR2_USART1EN; 										//Habilita Clock do USART1

	//Configura PA9 (TX) e PA10 (RX) como Alternate Function AF1
	// PA9 -> AFRH[3:0] bits (para pino 9)
	// PA10 -> AFRH[7:4] bits (para pino 10)
	GPIOA->MODER &= ~((3U << (9 * 2)) | (3U << (10 * 2))); 						//Limpa MODER
	GPIOA->MODER |=  (2U << (9 * 2)) | (2U << (10 * 2));   						//Modo AF

	GPIOA->AFR[1] &= ~((0xF << ((9 - 8) * 4)) | (0xF << ((10 - 8) * 4)));
	GPIOA->AFR[1] |=  (1U << ((9 - 8) * 4)) | (1U << ((10 - 8) * 4)); 			//AF1

	//Configura USART1
	USART1->CR1 &= ~USART_CR1_UE; 												//Desliga USART para configurar

	//Calcula BRR = fCK / BaudRate
	USART1->BRR = (SYSTEM_CLOCK + (baudrate / 2U)) / baudrate;

	//Configuração padrão: 8 bits, sem paridade, 1 stop
	USART1->CR1 |= USART_CR1_TE | USART_CR1_RE; 								//Habilita TX e RX

	//Habilita a interrupção de RX
	USART1->CR1 |= USART_CR1_RXNEIE_RXFNEIE;

	//Liga USART1
	USART1->CR1 |= USART_CR1_UE;

	//Habilita USART1 IRQ no NVIC
	NVIC_SetPriority(USART1_IRQn, 1);  											// prioridade 1
	NVIC_EnableIRQ(USART1_IRQn);
}

void UART1_Write(const char data){
	while (!(USART1->ISR & USART_ISR_TXE_TXFNF)); 								//Espera buffer livre
	USART1->TDR = data;
}

void UART1_Write_ln(const char data){
	UART1_Write(data);
	UART1_Write('\r');
	UART1_Write('\n');
}

void UART1_Write_Text(const char text[]){
	int i;
	for(i=0;text[i]!='\0';i++){
		UART1_Write(text[i]);
	}
}

void UART1_Write_Text_ln(const char text[]){
	UART1_Write_Text(text);
	UART1_Write('\r');
	UART1_Write('\n');
}
