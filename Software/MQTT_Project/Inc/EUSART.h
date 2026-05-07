/*
 * EUSART.h
 *
 *  Created on: 21 de abr. de 2026
 *      Author: matheus-cipolotti
 */

#ifndef EUSART_H_
#define EUSART_H_

void UART1_Init(unsigned long baudrate);
void UART1_Write(const char data);
void UART1_Write_ln(const char data);
void UART1_Write_Text(const char text[]);
void UART1_Write_Text_ln(const char text[]);

#endif /* EUSART_H_ */
