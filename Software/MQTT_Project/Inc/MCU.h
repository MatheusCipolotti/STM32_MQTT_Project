/*
 * MCU.h
 *
 *  Created on: 21 de abr. de 2026
 *      Author: matheus-cipolotti
 */

#ifndef MCU_H_
#define MCU_H_

void GPIO_Init(void);
void Osc_Init(void);
void Delay_ms(unsigned int Vezes);
void TIM6_init(void);

#endif /* MCU_H_ */
