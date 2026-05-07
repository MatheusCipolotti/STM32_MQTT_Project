################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Ethernet_W5500/DHCP/dhcp.c 

OBJS += \
./Ethernet_W5500/DHCP/dhcp.o 

C_DEPS += \
./Ethernet_W5500/DHCP/dhcp.d 


# Each subdirectory must supply rules for building sources it contributes
Ethernet_W5500/DHCP/%.o Ethernet_W5500/DHCP/%.su Ethernet_W5500/DHCP/%.cyclo: ../Ethernet_W5500/DHCP/%.c Ethernet_W5500/DHCP/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32G0 -DSTM32G0B0RETx -c -I../Inc -I/media/matheus-cipolotti/MDC/SENAI/TCC/Software/MQTT_Project/CMSIS/Device -I/media/matheus-cipolotti/MDC/SENAI/TCC/Software/MQTT_Project/CMSIS/Include -I/media/matheus-cipolotti/MDC/SENAI/TCC/Software/MQTT_Project/Ethernet_W5500 -I/media/matheus-cipolotti/MDC/SENAI/TCC/Software/MQTT_Project/Ethernet_W5500/MQTT -I/media/matheus-cipolotti/MDC/SENAI/TCC/Software/MQTT_Project/Ethernet_W5500/MQTT/MQTTPacket/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Ethernet_W5500-2f-DHCP

clean-Ethernet_W5500-2f-DHCP:
	-$(RM) ./Ethernet_W5500/DHCP/dhcp.cyclo ./Ethernet_W5500/DHCP/dhcp.d ./Ethernet_W5500/DHCP/dhcp.o ./Ethernet_W5500/DHCP/dhcp.su

.PHONY: clean-Ethernet_W5500-2f-DHCP

