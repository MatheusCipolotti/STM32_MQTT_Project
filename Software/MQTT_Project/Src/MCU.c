/*
 * MCU.c
 *
 *  Created on: 21 de abr. de 2026
 *      Author: matheus-cipolotti
 */

#include "stm32g0b0xx.h"

#include "MCU.h"
#include "main.h"

void GPIO_Init(void){
	RCC->IOPENR |= RCC_IOPENR_GPIOCEN;
	RCC->IOPENR |= RCC_IOPENR_GPIOBEN;
	RCC->IOPENR |= RCC_IOPENR_GPIOAEN;

	//=============================PA0===============================
	//Configura PA0 como saída (MODER0 = 01)
	GPIOA->MODER &= ~GPIO_MODER_MODE0_Msk;
	GPIOA->MODER |=  GPIO_MODER_MODE0_0;

	//Configura como Push-Pull (OT0 = 0)
	GPIOA->OTYPER &= ~GPIO_OTYPER_OT0_Msk;

	//Velocidade alta (OSPEEDR0 = 10)
	GPIOA->OSPEEDR &= ~GPIO_OSPEEDR_OSPEED0_Msk;
	GPIOA->OSPEEDR |= (2 << GPIO_OSPEEDR_OSPEED0_Pos);

	//Sem pull-up/pull-down (PUPDR0 = 00)
	GPIOA->PUPDR &= ~GPIO_PUPDR_PUPD0_Msk;

	//=============================PA1================================
	//Configura PA1 como entrada (MODER = 00)
	GPIOA->MODER &= ~GPIO_MODER_MODE1_Msk;
	//Sem pull-up/pull-down (PUPDR = 00)
	GPIOA->PUPDR &= ~GPIO_PUPDR_PUPD1_Msk;

	//=============================PC12===============================
	//Configura PC12 como saída (MODER12 = 01)
	GPIOC->MODER &= ~GPIO_MODER_MODE12_Msk;
	GPIOC->MODER |=  GPIO_MODER_MODE12_0;

	//Configura como Push-Pull (OT12 = 0)
	GPIOC->OTYPER &= ~GPIO_OTYPER_OT12_Msk;

	//Velocidade baixa (OSPEEDR12 = 00)
	GPIOC->OSPEEDR &= ~GPIO_OSPEEDR_OSPEED12_Msk;

	//Sem pull-up/pull-down (PUPDR12 = 00)
	GPIOC->PUPDR &= ~GPIO_PUPDR_PUPD12_Msk;

	//=============================PB2================================
	//Configura PB2 como entrada (MODER2 = 00)
	GPIOB->MODER &= ~GPIO_MODER_MODE2_Msk;
	//Sem pull-up/pull-down (PUPDR2 = 00)
	GPIOB->PUPDR &= ~GPIO_PUPDR_PUPD2_Msk;
	GPIOB->PUPDR |= GPIO_PUPDR_PUPD2_0;  							//PUPDR0 = 01 -> pull-up
}

void Osc_Init(void){
	//PLL
	RCC->CR |= RCC_CR_HSEON;										//Habilita o HSE
	while (!(RCC->CR & RCC_CR_HSERDY)); 							//Espera HSE estabilizar

	RCC->PLLCFGR = (RCC_PLLCFGR_PLLSRC_HSE     						//Fonte do clock do PLL = HSE
			| (16 << RCC_PLLCFGR_PLLN_Pos)  						//PLLN = 16
	        | (0 << RCC_PLLCFGR_PLLM_Pos)   						//PLLM = 1 (00b)
	        | (0 << RCC_PLLCFGR_PLLR_Pos)   						//PLLR = 2 (00b)
	        | RCC_PLLCFGR_PLLREN);          						//Habilita saída PLLR

	RCC->CR |= RCC_CR_PLLON;										//Liga o PLL
	while (!(RCC->CR & RCC_CR_PLLRDY)); 							//Espera o PLL estabilizar

	FLASH->ACR |= FLASH_ACR_LATENCY;								//Flash latency (1 wait state para 64MHz @ 1.2–1.8V)

	RCC->CFGR = (RCC->CFGR & ~RCC_CFGR_SW_Msk)						//Seleciona PLL como SYSCLK
			| (2 << RCC_CFGR_SW_Pos);

	while (((RCC->CFGR & RCC_CFGR_SWS_Msk) >>
			RCC_CFGR_SWS_Pos) != 2);
}

void Delay_ms(unsigned int Vezes){
	//Clock do sistema seja 8MHz
	unsigned int clock_freq = SYSTEM_CLOCK / 8; 					//Frequência após o prescaler (1:8)
	unsigned int Ticks = (clock_freq / 1000) * Vezes; 				//Calcula ticks para milissegundos

	if (Ticks > 0xFFFFFF) Ticks = 0xFFFFFF;  						//Limita ao valor máximo de 24 bits

	SysTick->LOAD = Ticks - 1;               						//Carrega o valor de Ticks
	SysTick->VAL = 0;                        						//Limpa o valor atual do contador
	SysTick->CTRL = SysTick_CTRL_ENABLE_Msk; 						//Habilita o SysTick

	//Espera o tempo terminar
	while (!(SysTick->CTRL & SysTick_CTRL_COUNTFLAG_Msk));

	SysTick->CTRL = 0; 												//Desabilita o SysTick
}

void TIM6_init(void){
    //Habilita clock do TIM6
    RCC->APBENR1 |= RCC_APBENR1_TIM6EN;

    //Configura prescaler e ARR para 1 ms
    TIM6->PSC = 64 - 1;       										//64 MHz / 64 = 1 MHz
    TIM6->ARR = 1000 - 1;     										//1000 ticks = 1 ms

    //Reset do contador
    TIM6->CNT = 0;

    //Habilita interrupção de update
    TIM6->DIER |= TIM_DIER_UIE;

    NVIC_EnableIRQ(TIM6_IRQn);

    //Inicia o timer
    TIM6->CR1 |= TIM_CR1_CEN;
}
