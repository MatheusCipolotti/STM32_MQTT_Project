/*
 * main.h
 *
 *  Created on: 21 de abr. de 2026
 *      Author: matheus-cipolotti
 */

#ifndef MAIN_H_
#define MAIN_H_

#define	SYSTEM_CLOCK						64000000

#define	UART1_BAUDRATE						115200

#define MENU_BUFFER_SIZE					30

#define LED_ON_BOARD_TOGGLE()				GPIOC->ODR ^= GPIO_ODR_OD12
#define LED_ON_BOARD_HIGH()					GPIOC->BSRR = GPIO_BSRR_BS12
#define LED_ON_BOARD_LOW()					GPIOC->BSRR = GPIO_BSRR_BR12

#endif /* MAIN_H_ */
