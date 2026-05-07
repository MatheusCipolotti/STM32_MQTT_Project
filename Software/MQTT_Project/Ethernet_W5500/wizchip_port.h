/*
 * wizchip_port.h
 *
 *  Created on: 21 de abr. de 2026
 *      Author: matheus-cipolotti
 */

#ifndef WIZCHIP_PORT_H_
#define WIZCHIP_PORT_H_

void wizchip_select(void);
void wizchip_deselect(void);
uint8_t spi2_readbyte(void);
void spi2_writebyte(uint8_t wb);

#endif /* WIZCHIP_PORT_H_ */
