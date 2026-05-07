/*
 * SPI.c
 *
 *  Created on: 21 de abr. de 2026
 *      Author: matheus-cipolotti
 */

#include "stm32g0b0xx.h"

#include "main.h"
#include "SPI.h"

void SPI2_Init(void){
	RCC->IOPENR |= RCC_IOPENR_GPIOBEN;   					//Habilita o clock do GPIOB
	RCC->APBENR1 |= RCC_APBENR1_SPI2EN;  					//Habilita o clock do SPI2

	// Modo alternativo (10)
	GPIOB->MODER &= ~(GPIO_MODER_MODE13 | GPIO_MODER_MODE14 | GPIO_MODER_MODE15);
	GPIOB->MODER |=  (2 << GPIO_MODER_MODE13_Pos) |
	                 (2 << GPIO_MODER_MODE14_Pos) |
	                 (2 << GPIO_MODER_MODE15_Pos);

	// AF0
	GPIOB->AFR[1] &= ~((0xF << (4 * (13 - 8))) |
	                   (0xF << (4 * (14 - 8))) |
	                   (0xF << (4 * (15 - 8))));

	// Alta velocidade
	GPIOB->OSPEEDR |= (3 << GPIO_OSPEEDR_OSPEED13_Pos) |
	                  (3 << GPIO_OSPEEDR_OSPEED14_Pos) |
	                  (3 << GPIO_OSPEEDR_OSPEED15_Pos);

	//=============================PA8 (CS)===============================
	RCC->IOPENR |= RCC_IOPENR_GPIOAEN;
	//Configura PA8 como saída (MODER8 = 01)
	GPIOA->MODER &= ~GPIO_MODER_MODE8_Msk;
	GPIOA->MODER |=  GPIO_MODER_MODE8_0;

	//Configura como Push-Pull (OT8 = 0)
	GPIOA->OTYPER &= ~GPIO_OTYPER_OT8_Msk;

	//Velocidade alta (OSPEEDR8 = 10)
	GPIOA->OSPEEDR &= ~GPIO_OSPEEDR_OSPEED8_Msk;
	GPIOA->OSPEEDR |= (2 << GPIO_OSPEEDR_OSPEED8_Pos);

	//Sem pull-up/pull-down (PUPDR8 = 00)
	GPIOA->PUPDR &= ~GPIO_PUPDR_PUPD8_Msk;

	GPIOA->BSRR = GPIO_BSRR_BS8; // CS = HIGH

	SPI2->CR1 = 0;
	SPI2->CR2 = 0;

	SPI2->CR1 =
	    SPI_CR1_MSTR |        								// Master
	    SPI_CR1_SSI  |        								// NSS interno alto
	    SPI_CR1_SSM  |        								// Software slave management
	    (0b010 << SPI_CR1_BR_Pos); 							// Baudrate

	SPI2->CR2 =
	    (7 << SPI_CR2_DS_Pos) |   							// 8 bits (DS = 7 → 8 bits)
	    SPI_CR2_FRXTH;            							// RXNE quando >= 8 bits

	SPI2->CR1 |= SPI_CR1_SPE;								//Habilita o SPI
}

uint8_t SPI2_Transfer(uint8_t data){
    // Espera TX vazio
    while (!(SPI2->SR & SPI_SR_TXE));

    *((__IO uint8_t*)&SPI2->DR) = data;

    // Espera RX cheio
    while (!(SPI2->SR & SPI_SR_RXNE));

    return *((__IO uint8_t*)&SPI2->DR);
}

